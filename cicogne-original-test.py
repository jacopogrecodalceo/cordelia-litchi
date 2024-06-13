import random
import abjad
import os
import math
import sys
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
PREAMBLE = make_preamble(TITLE, COMPOSER)
# ================================================

ly_sequenza = "g' c''' f'' ef''"
sequenza = [note for note in ly_sequenza.split()]
TIMESIG = (6, 8)

def choose_interval():
	intervals = ['-P8', '-P15']
	for sign in ["-", "+"]:
		for i in ['P5', 'm3']:
			intervals.append(f'{sign}{i}')
	return random.choice(intervals) #f'{direction}{interval}'

def remove_if_consecutive(voice):
	for i in range(len(voice)):
		if i < len(voice)-1:
			for note in voice[i].written_pitches:
				if note in voice[i+1].written_pitches:

					temp_list = list(voice[i].written_pitches)
					temp_list.remove(note)

					voice[i].written_pitches = temp_list


class Voice1():
# Make a chord from sequence
	def __init__(self, times=64):
		self.times = times
	
		self.build()
		self.dyn()
		return self.voice
	
	def build(self):
		self.voice = []
		for i in range(self.times):
			chord = abjad.Chord()

			local_seq = []
			if i != 0:
				for note in sequenza:
					local_note = abjad.Note(note)
					abjad.mutate.transpose(local_note, '-P8')
					abjad.mutate.transpose(local_note, choose_interval())
					local_seq.append(local_note)

			seen = set()
			index = 0
			while index < len(local_seq):
				if local_seq[index].written_pitch in seen:
					abjad.mutate.transpose(local_seq[index], choose_interval())
				else:
					seen.add(local_seq[index].written_pitch)
				index += 1

			chord.written_pitches = local_seq
			chord.written_duration = 1/8 if i % 2 == 0 else 1/4

			self.voice.append(chord)
	
	def dyn(self):
		make_messadivoce(self.voice, each=16, dynamic_cycle=[-3, 1])

#remove_if_consecutive(voice1)
staff1 = abjad.Staff([abjad.Voice(Voice1())])



voice2 = []
for i in range(64):
	chord = abjad.Chord()

	local_seq = []
	if i != 0:
		for note in sequenza:
			local_note = abjad.Note(note)
			abjad.mutate.transpose(local_note, '-P5')
			abjad.mutate.transpose(local_note, choose_interval())
			local_seq.append(local_note)

	seen = set()
	index = 0
	while index < len(local_seq):
		if local_seq[index].written_pitch in seen:
			abjad.mutate.transpose(local_seq[index], choose_interval())
		else:
			seen.add(local_seq[index].written_pitch)
		index += 1

	chord.written_pitches = local_seq
	chord.written_duration = 1/8 if i % 3 == 0 else 1/16

	voice2.append(chord)

remove_if_consecutive(voice2)
make_messadivoce(voice2, each=24, dynamic_cycle=[-4, -1])
staff2 = abjad.Staff([abjad.Voice(voice2)])



seq3 = [abjad.NamedPitch(n).number for n in sequenza]

seq_zeros = [0]*8
seq_var = []
index = 0
for i in range(len(seq3)):
    for n in seq_zeros:
        if random.random()<(i/len(seq3)):
            seq_var.append(seq3[i]*random.choice([1, -1]))
            seq_var[index-1] = seq_var[random.randint(0, index)]*random.choice([1, -1])
        else:
            seq_var.append(n)
        index += 1

for i in range(len(seq3)):
    for _ in seq_zeros:
        seq_var.append(random.choice(seq3[1:])*random.choice([1, -1]))
        while seq_var[index-1] == seq_var[index]:
            seq_var[index-1] = seq_var[random.randint(len(seq_zeros)*len(seq3), index)]*random.choice([1, -1])
        index += 1

abjad_seq = [abjad.Note(n, 1/8) for n in seq_var]
abjad_seq_r = [abjad.Note(n, 1/8) for n in seq_var[::-1]]
ab_seq = abjad_seq + abjad_seq_r

for i in range(len(ab_seq)):
	if i < len(ab_seq)-1:
		if ab_seq[i].written_pitch != ab_seq[i+1].written_pitch:
			glissando = abjad.Glissando()
			bundle = abjad.bundle(glissando, r"- \tweak color #blue")
			abjad.attach(bundle, ab_seq[i])

tuplets = [abjad.Tuplet('2:3', (ab_seq[i], ab_seq[i+1])) for i in range(0, len(ab_seq), 2) if i<len(ab_seq)-1]

voice3 = abjad.Voice(tuplets)
make_messadivoce(voice3, each=48, dynamic_cycle=[-4, 3])
#abjad.attach(abjad.Dynamic('pp'), voice3[0])
staff3 = abjad.Staff([voice3])

STAVEs = [
	staff1
]

abjad.attach(abjad.TimeSignature(TIMESIG), abjad.select.leaf(STAVEs[0], 0))

abjad_SCORE = abjad.Score(STAVEs)

for vertical_moment in abjad.iterate_vertical_moments(abjad_SCORE):
	pitches = [abjad.NamedPitch(note.written_pitch) if hasattr(note, 'written_pitch') else None for note in vertical_moment.leaves]
	if any(pitches.count(x) > 1 for x in pitches):
		seen = set()
		for note in vertical_moment.leaves:
			if hasattr(note, 'written_pitch') and abjad.NamedPitch(note.written_pitch) in seen:
				abjad.mutate.transpose(note, f'{random.choice(["+", "-"])}m3')
			else:
				seen.add(note)
    
litchi = Litchi('english')
#litchi = Litchi('english')

layout_block = abjad.Block('layout')
score_block = abjad.Block('score', [abjad_SCORE, layout_block])
lilypond_file = abjad.LilyPondFile([PREAMBLE if PREAMBLE else None, score_block])
abjad.persist.as_pdf(lilypond_file, pdf_file_path=os.path.join('', f'{EXPORT_TITLE}.pdf'))
abjad.show(lilypond_file)

litchi.load_score(os.path.join('', f'{EXPORT_TITLE}.ly'))
#litchi.load_score('/Users/j/Documents/CLI/cordelia-ly/_/240608-0120-my_heavy_head.ly')
#litchi.dump()
litchi.process()

csound_SCORE = 't 0 50'
csound_SCORE += '\n' + litchi.make_score()
csound_SCORE += '\ne'

with open(os.path.join(VERSION_DIR, f'{EXPORT_TITLE}.sco'), 'w') as f:
	f.write(csound_SCORE)
play(csound_SCORE, start_from=0, title=EXPORT_TITLE)
