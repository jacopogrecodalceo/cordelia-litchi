import random

import quickly
from quickly.dom import lily
from quickly.dom.scope import Scope

import abjad
import quickly.node

from src.const import CS_SCO_SEPARATOR, DYNs, OCTAVE_COMPENSATION, DYN_IDENTIFIERs
import src.convert as convert

ARPEGGIO_DURATION = 1/32
FERMATA_DURATION = 2
ACCENT_INCREMENT = 3/2
LY_RESTs = (lily.Rest, lily.MultiMeasureRest, lily.PitchedRest)
LY_TUPLETs = (lily.Tuplet, lily.Times)
LY_PITCHEDs = LY_RESTs + LY_TUPLETs + (lily.Note, lily.Chord)

class Note():
    pass

class Rest():
    pass

class Chord():
    pass

class Music_List():
    pass

class Litchi():

	def __init__(self, instrument_order, language='nederlands', human_onset=0, human_dur=0, ignore_arpeggios=False):
		self._set_defaults()
		self.language = language
		self.instrument_order = instrument_order

		self.ignore_arpeggios = ignore_arpeggios

		self.human_onset = human_onset
		self.human_dur = human_dur
  
	def load_score(self, lilypond_file, which=0):
		d = quickly.load(lilypond_file)
		m = d.get_transform(True)
		scores = [score for score in m // lily.Score]
		self.scope = Scope(d)
		self.ly_score = scores[which]
		for identifier in self.ly_score // lily.IdentifierRef:
			identifier.replace_with(identifier.get_value(self.scope))
		self._set_defaults()
		self.cs_score = {}
		self.cs_instrument_score = []
		self.hairpin_interp = []

	def _set_defaults(self):
		self.tempo = 60
		self.time_signature = (4, 4)
  
		self.quarter_note_in_second = 60 / self.tempo * self.time_signature[1]
		self.env = 'classic'

	@staticmethod
	def interpolate(start, end, n, direction):
		if direction == "<":
			step = (end - start) / n
			interpolated_values = [start + step * i for i in range(n)]
		elif direction == ">":
			step = (start - end) / n
			interpolated_values = [start - step * i for i in range(n)]
		else:
			raise ValueError("Invalid direction hairpin for interpolation")
		return interpolated_values

	def _convert_dur(self, duration, multiplier=1):
		if multiplier:
			ratio_dur = abjad.Duration(duration) * abjad.Duration(multiplier)
		else:
			ratio_dur = abjad.Duration(duration)
		return float(self.quarter_note_in_second * ratio_dur)

	def _convert_freq(self, head, octave):
		return abjad.NamedPitch(abjad.Note(head, language=self.language).written_pitch.get_name(), octave=OCTAVE_COMPENSATION+octave).hertz

	def deprecated_find_end(self, i):
		index = 0
		while i < len(self.leaves):
			leaf = self.leaves[i]
			if isinstance(leaf, (Note, Chord)):
				if hasattr(leaf, 'identifier') and leaf.identifier in DYN_IDENTIFIERs:
					self.hairpin_end = DYNs[DYN_IDENTIFIERs[leaf.identifier]]
					return index + 1  # Return and increment index
				index += 1  # Increment index for Note or Chord
				for articulation in leaf.leaf:
					if isinstance(articulation, lily.Articulations):
						for a in articulation:
							if isinstance(a, lily.Dynamic) and a.head not in ['>', '<', '!']:
								self.hairpin_end = DYNs[a.head]
								return index
				i += 1
			else:
				i += 1
		return False

	def deprecated_process_dyn(self):
		for i, leaf in enumerate(self.leaves):
			if isinstance(leaf, (Note, Chord)):
				if hasattr(leaf, 'identifier'):
					if leaf.identifier in DYN_IDENTIFIERs:
						self.dyn = DYNs[DYN_IDENTIFIERs[leaf.identifier]]

				for named_dyn in leaf.leaf // lily.Dynamic:
					head = named_dyn.head
					if not head in ['>', '<', '!']:
						self.dyn = DYNs[head]
					elif head in ['>', '<']:
						hairpin_direction = head
						index = self.find_end(i)
						#print(convert.amp2db(self.dyn), hairpin_direction, self.hairpin_end)
						if index:
							self.hairpin_interp = self.interpolate(self.dyn, self.hairpin_end, index, hairpin_direction)
				if self.hairpin_interp:
					#print(self.hairpin_interp)
					#print(self.hairpin_interp)
					leaf.dyn = convert.db2amp(self.hairpin_interp.pop(0))
				else:
					leaf.dyn = convert.db2amp(self.dyn)
    
     
	def _get_multiplier(self, tuplet):
		if isinstance(tuplet, lily.Tuplet):
			return tuplet[0].head[::-1]
		elif isinstance(tuplet, lily.Times):
			return tuplet[0].head

	@staticmethod
	def _is_same_note(note, comparison):
		if note.head == comparison.head and note.octave == comparison.octave:
			return True
		return False

	@staticmethod
	def is_fermata(leaf):
		for art in leaf // lily.Articulation:
			if 'fermata' in art.head:
				return FERMATA_DURATION
		return 0

	def process_leaves(self, staff):
		
		index = 0
		#staff.dump()
		while index < len(staff):
			leaf = staff[index]
			if leaf.height() != 0:
				if isinstance(leaf, lily.Chord):
					self._convert_leaf_to_chord(leaf)
					del staff[index]
				elif isinstance(leaf, LY_TUPLETs):
					self._convert_leaf_to_tuplet(leaf)
					del staff[index]
				elif isinstance(leaf, LY_RESTs):
					self._convert_leaf_to_rest(leaf)
					del staff[index]
				elif isinstance(leaf, lily.Note):
					self._convert_leaf_to_note(leaf)
					del staff[index]
					# Do not increment index since we've removed the current element
				elif isinstance(leaf, lily.SimultaneousMusicList) and set(type(item) for item in list(leaf)) == set((lily.MusicList, lily.New)):
					self._convert_leaf_to_music_list(leaf)
					del staff[index]
				else:
					# If the leaf is a nested list, recursively process it
					self.process_leaves(leaf)
					index += 1
			elif isinstance(leaf, lily.IdentifierRef):
				self.leaves[-1].identifier = leaf.head
				del staff[index]
			else:
				index += 1

	@staticmethod
	def find_instrument_name(staff):
		children = list(staff.descendants())
		while children:
			tok = children.pop(0)
			if isinstance(tok, lily.Symbol) and tok.head == 'instrumentName':
				while children:
					tok = children.pop(0)
					if isinstance(tok, lily.String):
						return tok.head
  
	def find_staves(self):
		staves = []
		for token_New in self.ly_score // lily.New:
			for each_New in token_New:
				if isinstance(each_New, lily.Symbol):
					if each_New.head in ['Staff', 'DevNull']:
						staves.append(token_New)
					elif each_New.head in ['PianoStaff', 'StaffGroup']:
						for token_Context in token_New // lily.Context:
							for each_Context in token_Context:
								if isinstance(each_Context, lily.Symbol):
									if each_Context.head in ['Staff', 'DevNull']:
										staves.append(token_Context)
    
		return staves

	def _find_durs(self, leaf, multiplier=1):
		if isinstance(leaf, lily.Chord):
			dur = self._convert_dur(leaf.duration + self.is_fermata(leaf), multiplier=multiplier)
			return dur
		elif isinstance(leaf, LY_TUPLETs):
			local_multiplier = self._get_multiplier(leaf)
			local_multiplier *= multiplier
			for tuplet_leaf in leaf[1]:
				self._find_durs(tuplet_leaf, multiplier=multiplier)
		elif isinstance(leaf, LY_RESTs):
			dur = leaf.duration
			for i in leaf // lily.DurationScaling:
				dur *= i.head 
			return self._convert_dur(dur + self.is_fermata(leaf), multiplier=multiplier)
		elif isinstance(leaf, lily.Note):
			dur = self._convert_dur(leaf.duration + self.is_fermata(leaf), multiplier=multiplier)
			return dur
		return 0

	def _recursive_music_list(self, main_music_list):
		index = 0
		while index < len(main_music_list):
			leaf = main_music_list[index]
			if isinstance(leaf, LY_PITCHEDs):
				dur = self._find_durs(leaf)
				self.local_music_list_durs.append(dur)
				self.local_music_list_leaves.append(leaf)
				#index += 1
				del main_music_list[index]
			else:
				self._recursive_music_list(leaf)
				index += 1

	def _convert_leaf_to_music_list(self, main_music_lists):
		durs = []
		music_lists = []
		for main_music_list in main_music_lists:
			music_list = Music_List()
			self.local_music_list_durs = []
			self.local_music_list_leaves = []
			self._recursive_music_list(main_music_list)
			dur = sum(self.local_music_list_durs)
			durs.append(dur)
			music_list.dur = dur
			music_list.leaves = self.local_music_list_leaves
			music_lists.append(music_list)
		self.leaves.append(music_lists)	
		assert all(x == durs[0] for x in durs)

	def _convert_pitched(self, leaf, multiplier=1, onset=None):
		if isinstance(leaf, lily.Chord):
			self._convert_leaf_to_chord(leaf, multiplier=multiplier, onset=onset)
		elif isinstance(leaf, LY_TUPLETs):
			self._convert_leaf_to_tuplet(leaf, multiplier=multiplier, onset=onset)
		elif isinstance(leaf, LY_RESTs):
			self._convert_leaf_to_rest(leaf, multiplier=multiplier, onset=onset)
		elif isinstance(leaf, lily.Note):
			self._convert_leaf_to_note(leaf, multiplier=multiplier, onset=onset)       

	def _convert_leaf_to_tuplet(self, leaf, multiplier=1, onset=None):
		local_multiplier = self._get_multiplier(leaf)
		local_multiplier *= multiplier
		for tuplet_leaf in leaf[1]:
			self._convert_pitched(tuplet_leaf, multiplier=local_multiplier, onset=onset)
    
	def _convert_leaf_to_chord(self, leaf, multiplier=None, onset=None):
		chord = Chord()
		chord.dur = self._convert_dur(leaf.duration + self.is_fermata(leaf), multiplier=multiplier)
		chord.leaf = leaf
		chord.notes = [note for note in leaf[0]]  
		chord.ties = [True for _ in leaf // lily.Tie]
		if onset: chord.onset = onset
		if hasattr(leaf, 'identifier'): chord.identifier = leaf.identifier
		while len(chord.ties) < len(chord.notes):
			chord.ties.append(False)
		self.leaves.append(chord)

	def _convert_leaf_to_rest(self, leaf, multiplier=None, onset=None):
		rest = Rest()
		rest.leaf = leaf
		dur = leaf.duration
		for i in leaf // lily.DurationScaling:
			dur *= i.head  
		rest.dur = self._convert_dur(dur + self.is_fermata(leaf), multiplier=multiplier)
		if onset: rest.onset = onset
		if hasattr(leaf, 'identifier'): rest.identifier = leaf.identifier

		self.leaves.append(rest)

	def _convert_leaf_to_note(self, leaf, multiplier=None, onset=None):
		note = Note()
		note.leaf = leaf
		if hasattr(leaf, 'identifier'): note.identifier = leaf.identifier
		if onset: note.onset = onset
		note.dur = self._convert_dur(leaf.duration + self.is_fermata(leaf), multiplier=multiplier)
		self.leaves.append(note)
   
	def calculate_onset(self):
		onset_music_lists = []
		for leaf in self.leaves:
			if isinstance(leaf, list):
				for music_list in leaf:
					music_list.onset = self.abs_time 
					#print(self.abs_time)
					onset_music_lists.append(music_list)
				self.abs_time += leaf[0].dur
			else:
				leaf.onset = self.abs_time
				self.abs_time += leaf.dur
		self.leaves.extend(onset_music_lists)

	def process_music_list(self):
		for leaf in self.leaves:
			if isinstance(leaf, Music_List):
				onset = leaf.onset
				for l in leaf.leaves:
					#print(onset, l, self._convert_dur(l.duration))
					self._convert_pitched(l, onset=onset)
					onset += self._convert_dur(l.duration)
				#self.leaves.pop(i)

	def undo_chords(self):
		last_dyn = None
		for leaf in self.leaves:
			if isinstance(leaf, Chord):
				arp = any(a for a in leaf.leaf // lily.Arpeggio) if not self.ignore_arpeggios else False
				arpeggio = 0
    
				dyns = [dyn for dyn in leaf.leaf // lily.Dynamic]
				if last_dyn:
					dyns = last_dyn
					last_dyn = None
				if not leaf.notes:
					last_dyn = dyns

				for chord_note, tie in zip(leaf.notes, leaf.ties):
					note = Note()
					note.dur = leaf.dur
					for dyn in dyns:
						chord_note.add(dyn)
					note.leaf = chord_note
					if arp:
						note.onset = leaf.onset + arpeggio
						arpeggio += self._convert_dur(ARPEGGIO_DURATION)
					else:
						note.onset = leaf.onset
					note.tie = tie

					if hasattr(leaf, 'identifier'): note.identifier = leaf.identifier
      
					self.notes.append(note)
			elif isinstance(leaf, Note):
				ties = [tie for tie in leaf.leaf // lily.Tie]
				assert len(ties) <= 1, f'Strange {len(ties)} is more than 1'
				leaf.tie = any(ties)
				self.notes.append(leaf)

	def recursive_tie(self, note, j, gliss=False):
		#print(f'{j}.Enter a tie:')
		while j < len(self.notes):
			next_note = self.notes[j]

			#print(f'NOTE: {note.leaf.head}{note.leaf.octave} --- NEXT: {next_note.leaf.head}{next_note.leaf.octave}')
			if self._is_same_note(note.leaf, next_note.leaf):
				#next_next_note = self.notes[j + 1]
				if hasattr(next_note, 'gliss_onset') or gliss == True:
					if not hasattr(note, 'gliss_onset'):
						#print(next_note.dur)
						note.gliss_onset = note.dur
						note.gliss_dur = next_note.gliss_dur
						note.gliss_end = next_note.gliss_end
					else:
						#print(note.leaf.head)
						note.gliss_onset -= next_note.dur

					note.dur += next_note.dur
					self.notes.pop(j)
					if getattr(next_note, 'tie', None):
						self.recursive_tie(note, j, gliss=True)
					return
				else:
					note.dur += next_note.dur
					self.notes.pop(j)
					if getattr(next_note, 'tie', None):
						self.recursive_tie(note, j)
					return
			else:
				j += 1
		return

	def process_ties(self):
		i = 0
		while i < len(self.notes):
			note = self.notes[i]
			if getattr(note, 'tie', None):
				j = i + 1
				self.recursive_tie(note, j)

			i += 1
   
	def process_gliss_skip(self, note, j):
		dur = note.dur
		while j < len(self.notes):
			#next_note = self.notes[j]
			next_note = self.notes.pop(j)
			note.dur += next_note.dur
			dur += next_note.dur
			if hasattr(next_note, 'identifier') and next_note.identifier == 'glissandoSkipOff':
				next_next_note = self.notes.pop(j)
				note.gliss_onset = 0
				note.gliss_dur = dur
				note.gliss_end = self._convert_freq(next_next_note.leaf.head, next_next_note.leaf.octave)
				#print(f'REMOVED {self.notes[k].leaf.head}{self.notes[k].leaf.octave}\n')
				#print(f'process_gliss_skip {note.leaf.head}{note.leaf.octave} glissandoskip starting at {note.gliss_onset} for {note.gliss_dur} to {next_next_note.leaf.head}{next_next_note.leaf.octave}')
				note.dur += next_next_note.dur
				#self.notes.pop(k)
				return
		return

	def recursive_gliss(self, note, j):
		if any(gliss for gliss in self.notes[j].leaf // lily.Glissando):
			next_note = self.notes.pop(j)
			note.gliss_onset = 0
			note.gliss_dur = note.dur
			note.gliss_end = self._convert_freq(next_note.leaf.head, next_note.leaf.octave)
			note.dur += next_note.dur
			self.recursive_gliss(note, j)
		return

	def process_gliss(self):
		i = 0
		while i < len(self.notes):
			note = self.notes[i]

			if hasattr(note, 'identifier') and note.identifier == 'glissandoSkipOn':
				if not hasattr(note, 'gliss_onset'):
					j = i + 1
					self.process_gliss_skip(note, j)
			elif any(gliss for gliss in note.leaf // lily.Glissando):
				if not hasattr(note, 'gliss_onset'):
					j = i + 1

					next_note = self.notes.pop(j)
					if (hasattr(note, 'identifier') and note.identifier == 'glissandoSkipOn') or (hasattr(next_note, 'identifier') and next_note.identifier == 'glissandoSkipOn'):
						self.process_gliss_skip(note, j)
					else:
						note.gliss_onset = 0
						note.gliss_dur = note.dur
						note.gliss_end = self._convert_freq(next_note.leaf.head, next_note.leaf.octave)
						note.dur += next_note.dur
					#self.recursive_gliss(note, j)
			i += 1

	def find_end(self, i):
		index = 0
		while i < len(self.notes):
			note = self.notes[i]
			if getattr(note, 'identifier', None) in DYN_IDENTIFIERs:
				self.hairpin_end = DYNs[DYN_IDENTIFIERs[note.identifier]]
				return index + 1  # Return and increment index
			for named_dyn in note.leaf // lily.Dynamic:
				head = named_dyn.head
				if not head in ['>', '<', '!']:
					self.hairpin_end = DYNs[head]
					return index
			index += 1  # Increment index for Note or Chord
			i += 1
		return False

	def process_dyn(self):
		for i, note in enumerate(self.notes):
			if getattr(note, 'identifier', None) in DYN_IDENTIFIERs:
				self.dyn = DYNs[DYN_IDENTIFIERs[note.identifier]]

			for named_dyn in note.leaf // lily.Dynamic:
				head = named_dyn.head
				if not head in ['>', '<', '!']:
					self.dyn = DYNs[head]

				elif head in ['>', '<']:
					hairpin_direction = head
					index = self.find_end(i + 1)
					if index:
						self.hairpin_interp = self.interpolate(self.dyn, self.hairpin_end, index, hairpin_direction)
			if self.hairpin_interp:
				#print(self.hairpin_interp)
				note.dyn = convert.db2amp(self.hairpin_interp.pop(0))
			else:
				note.dyn = convert.db2amp(self.dyn)

	def remove_rests(self):
		self.notes = [note for note in self.notes if isinstance(note, Note)]

	def _make_csound_score(self, staff_num):
		for note in self.notes:
			freq = self._convert_freq(note.leaf.head, note.leaf.octave)
			if not hasattr(note, 'gliss_onset'):
				""" if staff_num == 0:
					tied = random.choice([1, -1])
					self.cs_instrument_score.append([
						f'i 14.{staff_num+1}',
						note.onset+(random.random()*self.human_onset),
						tied*note.dur+(random.random()*self.human_dur),
						note.dyn,
						tied*freq, 0, 0, 0
					])
				else:
					self.cs_instrument_score.append([
						f'i 14.{staff_num+1}',
						note.onset+(random.random()*self.human_onset),
						note.dur+(random.random()*self.human_dur),
						note.dyn,
						freq, 0, 0, 0
					]) """				
				self.cs_instrument_score.append([
					f'i "{self.instrument_order[staff_num + 1]}"',
					note.onset+(random.random()*self.human_onset),
					note.dur+(random.random()*self.human_dur),
					note.dyn,
					freq, 0, 0, 0
				])
			else:
				#print(f'{note.leaf.head} {note.onset} {note.dur} // {note.gliss_onset} {note.gliss_dur}')
				self.cs_instrument_score.append([
					f'i "{self.instrument_order[staff_num + 1]}"',
					note.onset+(random.random()*self.human_onset),
					note.dur+(random.random()*self.human_dur),
					note.dyn,
					freq,
					note.gliss_onset*60/150,
					note.gliss_dur*60/150,
					note.gliss_end
				])

	def _format_score_line(self, line):
		formatted_elements = []
		for i, element in enumerate(line):
			if isinstance(element, float) and element != 0:
				formatted_element = "{:<10.5f}".format(element)
			else:
				formatted_element = "{:<10}".format(element)
			if i == 1:
				formatted_time = convert.ss2hhmmss(element)
				line.append(f"; {formatted_time}")
			formatted_elements.append(formatted_element)
		return "\t\t".join(formatted_elements)

	def make_score(self):
     
		string = ';---BEGINNING---'

		for staff_num, instrument_score in self.cs_score.items():
			string += CS_SCO_SEPARATOR
			string += f"; Staff {staff_num}"
			string += CS_SCO_SEPARATOR

			for line in instrument_score:
				formatted_score_line = self._format_score_line(line)
				string += formatted_score_line + "\n"

		return string

	def process_articulations(self):
		for note in self.notes:
			for art in note.leaf // lily.Articulation:
				if art.head == '>':
					note.dyn *= ACCENT_INCREMENT
				elif art.head == '!':
					note.dur *= 1/2
				elif art.head == '-':
					note.dur *= 1.5


	def process(self):
		print('Processing leaves..')

		staves = self.find_staves()

		print(f'There are {len(staves)} staves')
		for i, staff in enumerate(staves):

			self.cs_instrument_score = []
			self.staff_index = i + 1
			self.abs_time = 0
			self.dyn = DYNs['mf'] # Beginning dynamic

			self.leaves = []

			print('-'*32)
			print(f'Process staff {self.staff_index}')
			print('-'*32)
			self.process_leaves(staff)
			self.calculate_onset()
			self.process_music_list()

			self.notes = []
			self.undo_chords()
   
			assert all(isinstance(note, Note) for note in self.notes)
   
			self.process_dyn()
			self.process_gliss()
			self.process_ties()
			self.process_articulations()
			self._make_csound_score(i)

			self.cs_score[self.staff_index] = self.cs_instrument_score

