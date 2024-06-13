import random
import abjad
import os
import math
import sys

from _csound.play import play
from src.utils import make_messadivoce, make_dyn_seq

from src.abjad2csound import Csound_score
from src.const import *

TITLE = 'cicogne'
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


# CHOOSE SEQUENCEs
# ================================================
raw1 = ["e'8 b'4. f'8 a'4."]
raw2 = ["e'8 e'4. f'8 e'4.", "e'8 e'4. e'8 e'4.", "e'16 f'16 e'4. e'8 e'4."]

TIMESIG = (4, 4)

p1 = [[abjad.Note(leaf) if not leaf.startswith('r') else abjad.Rest(leaf) for leaf in seq.split()] for seq in raw1]
p2 = [[abjad.Note(leaf) if not leaf.startswith('r') else abjad.Rest(leaf) for leaf in seq.split()] for seq in raw2]

seq = []

for i in range(max([len(p1), len(p2)])):
	length = len(seq)
	if i < len(p1):
		seq.extend(abjad.mutate.copy(p1[i]))
	if i < len(p2):
		seq.extend(abjad.mutate.copy(p2[i]))
	abjad.attach(abjad.bundle(abjad.StartPhrasingSlur(), r"- \tweak color #red"), seq[length])
	abjad.attach(abjad.StopPhrasingSlur(), seq[-1])
	
for _ in range(4):
	length = len(seq)
	seq.extend(abjad.mutate.copy(random.choice(p1)))
	seq.extend(abjad.mutate.copy(random.choice(p2)))
	abjad.attach(abjad.bundle(abjad.StartPhrasingSlur(), r"- \tweak color #red"), seq[length])
	abjad.attach(abjad.StopPhrasingSlur(), seq[-1])

voice_concat = abjad.sequence.flatten([abjad.mutate.copy(seq) for _ in range(4)])
abjad.mutate.transpose(voice_concat, '+P8')

voice_15a = abjad.mutate.copy(voice_concat)
for note in voice_15a:
	note.written_duration = abjad.Duration((1, 2))
	abjad.mutate.transpose(note, '-P8')
	abjad.mutate.transpose(note, '-P8')

voice_8va = abjad.mutate.copy(voice_concat)
for note in voice_8va:
	note.written_duration = abjad.Duration((1, 4))
	abjad.mutate.transpose(note, '-P8')

""" raw_magic_voice = abjad.mutate.copy(voice_concat)
magic_group = [raw_magic_voice[i:i+32] for i in range(0, len(raw_magic_voice), 32)]
magic_voice = []
for group in magic_group:
	abjad.mutate.transpose(group, '-P15')
	abjad.mutate.transpose(group, '-P8')
	for i, note in enumerate(group[:-1]):
		note.written_duration = abjad.Duration((1, 128))
		if hasattr(note, 'written_pitch') and hasattr(group[i+1], 'written_pitch'):
			interval = abjad.NamedInterval.from_pitch_carriers(note.written_pitch, group[i+1].written_pitch)
			while interval.direction_number <= 0:
				abjad.mutate.transpose(group[i+1], '+m3')
				interval = abjad.NamedInterval.from_pitch_carriers(note.written_pitch, group[i+1].written_pitch)
			if interval > abjad.NamedInterval('P5'):
				abjad.mutate.transpose(note, '-m3')
		magic_voice.append(note) """

#abjad.show(abjad.Score([abjad.Staff([abjad.Voice(magic_voice)])]))

raw_sequenza_5a = abjad.mutate.copy(voice_concat)
sequenza_5a_groups = [raw_sequenza_5a[i:i+4] for i in range(0, len(raw_sequenza_5a), 4)]
voice_5a = []
for group in sequenza_5a_groups:
	for note in group:
		note.written_duration = abjad.Duration((1, 8))	

	abjad.mutate.transpose(group, '-P5')
	if random.random()>.5:
		tuplet = abjad.Tuplet('3:2', group[:-1])
	else:
		tuplet = abjad.Rest('r4')
	voice_5a.append(tuplet)

raw_sequenza_4a = abjad.mutate.copy(voice_concat)
sequenza_4a_groups = [raw_sequenza_4a[i:i+5] for i in range(0, len(raw_sequenza_4a), 5)]
voice_4a = []
for group in sequenza_4a_groups:
	for note in group:
		note.written_duration = abjad.Duration((1, 16))	

	abjad.mutate.transpose(group, '-P4')
	if random.random()>.5:
		tuplet = abjad.Tuplet('5:4', group)
	else:
		tuplet = abjad.Rest('r4')
	voice_4a.append(tuplet)


raw_sequenza_7 = abjad.mutate.copy(voice_concat)
voice_7 = []
for note in raw_sequenza_7[:32]:
	note.written_duration = abjad.Duration((1, 16))	
	abjad.mutate.transpose(note, '-P8')
	abjad.mutate.transpose(note, '-P8')
	abjad.mutate.transpose(note, '-P8')
	tuplet = abjad.Tuplet('7:4', [abjad.mutate.copy(note) for _ in range(7)])
	voice_7.append(tuplet)

for leaf in voice_concat:
	if hasattr(leaf, 'written_pitch') and leaf.written_pitch == "c'''":
		if random.random() < 0.25:
			abjad.mutate.transpose(leaf, f'{random.choice(["+", "-"])}m3')
		elif random.random() < 0.25:
			abjad.mutate.transpose(leaf, '-P8')

VOICEs = [
    (voice_concat, 'treble', 'giggly', (4*2, make_dyn_seq(-4, 2))),
    #(magic_voice, 'treble', 'repuck', (8, [4, 1, -2, -3])),
    (voice_5a, 'treble', 'giggly', (3*2, make_dyn_seq(-4, 1))),
    (voice_4a, 'treble', 'giggly', (5*2, make_dyn_seq(-4, 1))),
    (voice_8va, 'treble', 'repuck', (2, make_dyn_seq(-4, 1))),
    (voice_15a, 'bass', 'repuck', (1, make_dyn_seq(-4, 2))),
    (voice_7, 'bass', 'giggly', (7*2, make_dyn_seq(-1, 3))),
]

for voice, clef, instr, dyn_group in VOICEs[1:]:
	for n in voice:
		if isinstance(n, abjad.Tuplet):
			for t in n:
				t.written_duration *= 2
		else:
			n.written_duration *= 2
	voice.insert(0, abjad.Rest('r8'))

STAVEs = []
for voice, clef, instr, dyn_group in VOICEs:
	dur = 0
	index = 0
	for i, n in enumerate(voice):
		if isinstance(n, abjad.Tuplet):
			dur += n.multiplied_duration
		else:
			dur += n.written_duration
		index = i
		if dur > 10:
			break
	each, dynamic_cycle = dyn_group
	staff = abjad.Staff([abjad.Voice(voice[:index])])
	make_messadivoce(staff, each=each, dynamic_cycle=dynamic_cycle)
	abjad.attach(abjad.InstrumentName(abjad.Markup(rf'\markup "{instr}"')), abjad.select.leaf(staff, 0))
	abjad.attach(abjad.Clef(clef), abjad.select.leaf(staff, 0))
	STAVEs.append(staff)

abjad.attach(abjad.TimeSignature(TIMESIG), abjad.select.leaf(STAVEs[0], 0))
abjad.attach(abjad.LilyPondLiteral('\partial 8'), abjad.select.leaf(STAVEs[0], 0))

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
    
csound_SCORE = 't 0 40 90 40 90 50 120 30'
for staff in abjad_SCORE:
	csound_SCORE += '\n' + Csound_score(staff, tempo=60, time_signature=TIMESIG).process()
csound_SCORE += '\ne'

with open(os.path.join(VERSION_DIR, f'{EXPORT_TITLE}.sco'), 'w') as f:
	f.write(csound_SCORE)

play(csound_SCORE, abjad_SCORE, PREAMBLE, EXPORT_TITLE, VERSION_DIR)
