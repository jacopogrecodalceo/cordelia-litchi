import random
import abjad
import abjadext.rmakers
import os
import math
import sys

import abjad.sequence
from src.ly2csound import Litchi

from _csound.play import play
from src.utils import make_messadivoce, make_dyn_seq

from src.const import *

TITLE = 'canoni'
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

TIMESIG = (3, 4)

INSTRUMENT_NAME_ORDER = {
	1: 'giggly',
	2: 'repuck',
	3: 'repuck',
	4: 'repuck',
	5: 'xylo',
	6: 'xylo'
}

#melody_staff = abjad.Staff("g'16 c''16 f''16 ef''16 g'16 d''4 c''4 f''8. ef''16")
melody_staff = abjad.Staff("g'16 f'4. e'2. g'4 f'8 c'8. e'4")
abjad.mutate.transpose(melody_staff, 'P5')
staves = []
for voice_number in range(4):
	scale_factor = 2 ** voice_number
	staff_pitches = []
	for logical_tie in abjad.iterate.logical_ties(melody_staff):
		first_leaf = logical_tie[0]
		if isinstance(first_leaf, abjad.Rest):
			staff_pitches.append('r')	
		else:
			staff_pitches.append(first_leaf.written_pitch)
	staff_durations = [chain.written_duration * scale_factor for chain in abjad.iterate.logical_ties(melody_staff)]
	scaled_staff = abjad.Staff()
	for pitch, duration in zip(staff_pitches, staff_durations):
		if isinstance(pitch, abjad.NamedPitch):
			scaled_staff.append(abjad.Note(pitch, duration))
		else:
			scaled_staff.append(abjad.Rest(duration))
	abjad.mutate.transpose(scaled_staff, voice_number * -7)
	abjad.mutate.split(scaled_staff[:], [TIMESIG], cyclic=True)

	staves.append(scaled_staff)

times = [sum(logical_tie.written_duration for logical_tie in abjad.iterate.leaves(staff)) for staff in staves]
max_time = abjad.Duration(max(times))

for staff, time in zip(staves, times):
	index = 0
	while time < max_time:
		time = abjad.Duration(sum(logical_tie.written_duration for logical_tie in abjad.iterate.leaves(staff)))
		staff.extend(abjad.mutate.copy(staff))
		index += 1
  
for staff in staves:
	runs = abjad.select.runs(staff)
	notes = [abjad.select.notes(_) for _ in runs]
	for i, note in enumerate(notes[:-1]):
		if note.written_pitch == notes[i + 1].written_pitch:
			abjadext.rmakers.tie(note)
	abjadext.rmakers.extract_trivial(staff)    

for i, logical_tie in enumerate(abjad.iterate.leaves(staves[0])):
    
	if random.random() > .65:
		interval = random.choice(['-P4', '-P5', '-M3'])
		abjad.mutate.transpose(logical_tie, interval)

		markup = abjad.Markup(rf'\markup \teeny "{interval}"')
		bundle = abjad.bundle(markup, r"- \tweak color #blue")
		abjad.attach(bundle, logical_tie, direction=abjad.UP)

meter = abjad.Meter()
for staff in staves:
	for shard in abjad.mutate.split(staff[:], [TIMESIG], cyclic=True):
		abjad.Meter.rewrite_meter(shard, meter)

for staff in staves[2:]:
	abjad.attach(abjad.Clef('bass'), staff[0])

for staff in staves:
	abjad.attach(abjad.TimeSignature(TIMESIG), staff[0])

for staff in staves:
	runs = abjad.select.runs(staff)
	for note in abjad.select.notes(runs):
		if random.random() > .65:
			abjad.attach(abjad.Dynamic(random.choice(['p', 'mf', 'pp'])), note)

go = True

""" melody_staff = abjad.Staff("c'4 cs'8 d' ds' e' f'4 fs' g' gs'8 a' b' c''")

scaled_staves = []
for voice_number in range(23):
	scale_factor = 2 ** voice_number
	staff_pitches = []
	for logical_tie in abjad.iterate.logical_ties(melody_staff):
		first_leaf = logical_tie[0]
		staff_pitches.append(first_leaf.written_pitch)

	staff_durations = []
	for chain in abjad.iterate.logical_ties(melody_staff):
		dur = chain.written_duration * scale_factor 
		while not dur.is_assignable:
			dur = dur / 2
		staff_durations.append(dur)

	scaled_staff = abjad.Staff()
	selections = abjad.makers.make_notes(staff_pitches, staff_durations)
	scaled_staff.extend(selections)
	abjad.mutate.transpose(scaled_staff, voice_number * -7)
	abjad.mutate.split(scaled_staff[:], [abjad.TimeSignature((2, 4))], cyclic=True)
	scaled_staves.append(scaled_staff)

score = abjad.Score(scaled_staves)

for staff in score[1:]:
	abjad.attach(abjad.Clef('bass'), staff[0])

for staff in score:
	abjad.attach(abjad.TimeSignature(TIMESIG), staff[0])

meter = abjad.Meter()
for staff in score:
	for shard in abjad.mutate.split(staff[:], [abjad.Duration(24, 4)], cyclic=True):
		abjad.Meter.rewrite_meter(shard, meter)

abjad.show(score) """


if go:
	abjad_SCORE = abjad.Score(staves)
		

	litchi = Litchi(INSTRUMENT_NAME_ORDER, language='english', human_onset=0, human_dur=0)
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

	with open(f'{EXPORT_PATH}.sco', 'w') as f: f.write(csound_SCORE)
	
	play(csound_SCORE, start_from=0, title=EXPORT_TITLE, export=False, export_path=EXPORT_PATH)
