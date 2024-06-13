import random
import abjad
import os
import math
import sys
from src.ly2csound import Litchi

from _csound.play import play
from src.utils import make_messadivoce, make_dyn_seq

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
raw_sequenza = "g'16 c'''16 f''16 ef''16"
TIMESIG = (4, 16)

sequenza_shuffled = [raw_sequenza.split() for _ in range(32)]
sequenza = []
for s in sequenza_shuffled[1:]:
	random.shuffle(s)
	for n in s:
		sequenza.append(abjad.Note(n) if not n.startswith('r') else abjad.Rest(n))

for i, note in enumerate(sequenza[:-1]):
	if note.written_pitch == sequenza[i+1].written_pitch:
		if random.random() < .25:
			abjad.mutate.transpose(note, f'{random.choice(["+", "-"])}m3')
		else:
			tie = abjad.Tie()
			bundle = abjad.bundle(tie, r"- \tweak color #blue")
			abjad.attach(bundle, note)


sequenza_rests = abjad.mutate.copy(sequenza)
for i, note in enumerate(sequenza_rests):
	if random.random()>.5:
		sequenza_rests[i] = abjad.Rest(note.written_duration)

voice_concat = sequenza + sequenza_rests

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

durs = []
for voice, clef, instr, dyn_group in VOICEs:
	dur = 0
	for i, n in enumerate(voice):
		if isinstance(n, abjad.Tuplet):
			dur += n.multiplied_duration
		else:
			dur += n.written_duration
		if dur > 90:
			durs.append(dur)
			break

min_dur = min(durs)
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
#litchi.dump()
litchi.process()


csound_SCORE = 't 0 30'
csound_SCORE += '\n' + litchi.make_score()
csound_SCORE += '\ne'

score = True
if score:
	with open(os.path.join(VERSION_DIR, f'{EXPORT_TITLE}.sco'), 'w') as f:
		f.write(csound_SCORE)

#print(csound_SCORE)
play(csound_SCORE, start_from=0, title=EXPORT_TITLE)

