import random
import abjad
import os
import math
import sys

import abjad.sequence
from src.ly2csound import Litchi

from _csound.play import play
from src.utils import make_messadivoce, make_dyn_seq

from src.const import *

TITLE = 'my heavy head'
COMPOSER = "jacopo greco d'alceo"
VERSION = '0.0.1'

# ================================================
if len(TITLE) > 25:
	local_TITLE = ''.join(word[0] for word in TITLE.split())
else:
	local_TITLE = TITLE
EXPORT_TITLE = f"{DATE}-{local_TITLE.replace(' ', '_')}"
EXPORT_PATH = os.path.join(VERSION_DIR, CREATION_DIR, EXPORT_TITLE)
PREAMBLE = make_preamble(TITLE, COMPOSER)
# ================================================

TIMESIG = (4, 4)

INSTRUMENT_NAME_ORDER = {
	1: 'xylo',
	2: 'repuck',
	3: 'repuck',
	4: 'repuck',
	5: 'repuck',
	6: 'repuck'
}


rhythms = [
    [
    7/8,
    1/8
    ],
    [
    3/4,
    1/8, 1/8
    ],
    [
	1/16, 3/16,
	1/4,
	2/4
	],
    [
	1/16, 3/16,
	1/16, 1/16, 1/16, 1/16,
	1/8, 3/8
 	]
]

assert sum([sum(rhy) for rhy in rhythms]) == (TIMESIG[0] / TIMESIG[1]) * len(rhythms)

sequenza = [
    ["g' c''' f'' ef''".split()], 
    ["g' d''' ef'' d''".split()], 
    ["g' c'' f'' ef''".split()], 
    ["gs' ef''' f'' d''".split()],
    ["g' c'' fs'' e''".split()], 
    ["g' d'' fs'' e''".split()], 
]

sequenza.extend(sequenza[::-1])
random.shuffle(sequenza)
sequenza.extend(sequenza)

voice1 = []
for motifs in sequenza:
	for motif in motifs:
		for rhythm in rhythms:
			random.shuffle(rhythm)
			for i, rhy in enumerate(rhythm):
				voice1.append(abjad.Note(motif[i%len(motif)], abjad.Duration(rhy)))

abjad.attach(abjad.Dynamic('f'), voice1[0])
staff1 = abjad.Staff([abjad.Voice(voice1)])



class Builder():
# Make a chord from sequence
	def __init__(self, soprano, harmony, dur):
		self.voice = []
		self.soprano = soprano
		self.harmony = harmony
		self.dur = dur

	def ensure(self):
		
		min_distance = 5
		i = 0
		while True:
			i = i % len(self.notes)

			result = []
			print(self.notes)
			for j in range(len(self.notes)):
				for k in range(len(self.notes)):
					if j != k:
						if abs(abs(self.notes[j].number) - abs(self.notes[k].number)) < min_distance:
							result.append(self.notes[j])

			# Ensure soprano is higher
			if self.notes[i] >= self.soprano:
				interval_choice = random.choice(['-P5', '-m3'])
				self.notes[i] = self.notes[i].transpose(interval_choice)
				continue

			elif any(result):
				for j in range(len(self.notes)):
					for k in range(len(self.notes)):
						if j != k:
							if abs(abs(self.notes[j].number) - abs(self.notes[k].number)) < min_distance:
								interval_choice = random.choice(['+P5', '+m3', '-P5', '-m3'])
								self.notes[j] = self.notes[j].transpose(interval_choice)
								continue
	
			elif self.notes[i] in self.notes[:i] + self.notes[i+1:]:
				interval_choice = random.choice(['+P4', '+m3', '-P4', '-m3'])
				self.notes[i] = self.notes[i].transpose(interval_choice)
				continue
		
			else:
				if all(n < self.soprano for n in self.notes) and len(set(self.notes)) == len(self.notes):
					break
				i += 1

	def chord(self):
		self.notes = []

		chord = abjad.Chord()
		for note in self.harmony:
			interval = random.choice(['-P8', '-P15'])
			named_pitch = abjad.NumberedPitch(note).transpose(interval)
			self.notes.append(named_pitch)

		self.ensure()

		chord.written_pitches = [abjad.Note(named_pitch.name) for named_pitch in self.notes]
		chord.written_duration = self.dur

		return chord

voice2 = []
for motifs in sequenza:
	for motif in motifs:
		for rhythm in rhythms:
			random.shuffle(rhythm)
			for i, rhy in enumerate(rhythm):
				chord = Builder(motif[i%len(motif)], motif, rhy).chord()
				voice2.append(chord)


abjad.attach(abjad.Dynamic('pp'), voice2[0])

voice2_treble = []
voice2_bass = []

for chord in voice2:
	trebles = [note for note in chord.written_pitches if note.number >= -2]
	if not trebles:
		chord_treble = abjad.Rest(chord.written_duration)
	else:
		chord_treble = abjad.Chord()
		chord_treble.written_duration = chord.written_duration
		chord_treble.written_pitches = trebles
	voice2_treble.append(chord_treble)
	abjad.attach(abjad.Arpeggio(), voice2_treble[-1])
  
	basses = [note for note in chord.written_pitches if note.number < -2]
	if not basses:
		chord_bass = abjad.Rest(chord.written_duration)
	else:
		chord_bass = abjad.Chord()
		chord_bass.written_duration = chord.written_duration
		chord_bass.written_pitches = basses
	voice2_bass.append(chord_bass)
	abjad.attach(abjad.Arpeggio(), voice2_bass[-1])

indices_to_remove = []
for voice in [voice2_treble, voice2_bass]:
	for i in range(len(voice)-1):
		chord = voice[i]
		if isinstance(chord, abjad.Chord) and isinstance(voice[i + 1], abjad.Chord):
			for note in chord.written_pitches:
				for note2 in voice[i + 1].written_pitches:
					if note == note2:
						indices_to_remove.append(i)

voice = [item for index, item in enumerate(voice) if index not in indices_to_remove]


staff2_treble = abjad.Staff([abjad.Voice(voice2_treble)], name='treble')
staff2_bass = abjad.Staff([abjad.Voice(voice2_bass)], name='bass')
abjad.attach(abjad.Clef('bass'), abjad.select.leaf(staff2_bass[0], 0))


staff2 = abjad.StaffGroup([staff2_treble, staff2_bass], lilypond_type="PianoStaff")

STAVEs = [
	staff1,
	staff2
]

abjad.attach(abjad.TimeSignature(TIMESIG), abjad.select.leaf(STAVEs[0], 0))
abjad_SCORE = abjad.Score(STAVEs)
    
litchi = Litchi(INSTRUMENT_NAME_ORDER, language='english', human_onset=1/32, human_dur=0)

layout_block = abjad.Block('layout')
score_block = abjad.Block('score', [abjad_SCORE, layout_block])
lilypond_file = abjad.LilyPondFile([PREAMBLE if PREAMBLE else None, score_block])
abjad.persist.as_pdf(lilypond_file, pdf_file_path=f'{EXPORT_PATH}.pdf')
abjad.show(lilypond_file)

litchi.load_score(f'{EXPORT_PATH}.ly')
litchi.process()

csound_SCORE = 't 0 50'
csound_SCORE += '\n' + litchi.make_score()
csound_SCORE += '\ne'

with open(f'{EXPORT_PATH}.sco', 'w') as f:
	f.write(csound_SCORE)
 
play(csound_SCORE, start_from=0, export=False, export_path=EXPORT_PATH)
