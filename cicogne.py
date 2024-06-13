import random
import abjad
import os
import sys

import abjad.sequence

from _csound.play import play
from src.utils import make_messadivoce

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
sequenza = "g'16 c'''16 f''16 ef''16"
TIMESIG = (4, 16)

main_voice = []
sequenza_ripetuta = [sequenza.split() for _ in range(4)]
for seq in sequenza_ripetuta[1:]:
	random.shuffle(seq) 

sequenza_ripetuta = abjad.sequence.flatten(sequenza_ripetuta)
sequenza_retrograda = sequenza_ripetuta + sequenza_ripetuta[::-1]

for leaf in sequenza_retrograda:
	if leaf.startswith('r'):
		main_voice.append(abjad.Rest(leaf))
	else:
		main_voice.append(abjad.Note(leaf))

for current_leaf, next_leaf in zip(main_voice, main_voice[1:]):
	if hasattr(current_leaf, 'written_pitch') and hasattr(next_leaf, 'written_pitch'):
		if current_leaf.written_pitch == next_leaf.written_pitch:
			abjad.mutate.transpose(next_leaf, f'{random.choice(["+", "-"])}m3')
		if current_leaf.written_pitch == "c'''":
			if random.random() < 0.75:
				abjad.mutate.transpose(current_leaf, '+m3')
			elif random.random() < 0.5:
				abjad.mutate.transpose(current_leaf, '-P8')

voice_4a = []
# Iterate over `main_voice` in steps of 3
for i in range(0, len(main_voice), 3):
	# Determine the notes or rests to include in the tuplet
	notes = abjad.mutate.copy(main_voice[i:i + 3])

	for note in notes:
		note.written_duration = abjad.Duration(1, 8)

	# If there are less than 3 notes left, fill with rests
	while len(notes) < 3:
		notes.append(abjad.Rest((1, 8)))
	
	# Create the tuplet and append it to `voice_4a`
	tuplet = abjad.Tuplet((2, 3), notes)
	voice_4a.append(tuplet)
abjad.mutate.transpose(voice_4a, '-P5')

voice_5a = abjad.mutate.copy(main_voice)
abjad.mutate.transpose(voice_5a, '-P8')
for i in range(0, len(voice_5a), 2):
	current_leaf = voice_5a[i]
	next_leaf = voice_5a[i+1]
	current_leaf.written_duration = 3/16
	next_leaf.written_duration = 1/16


group_voice3 = [abjad.mutate.copy(main_voice[i:i+5]) for i in range(0, len(main_voice), 4)]
voice3 = []
# Iterate over `main_voice` in steps of 3
for group in group_voice3:
	while len(group) < 5:
		group.append(abjad.Rest((1, 16)))
	# Rotate
	group = group[:1] + group[1:]
	group[0] = abjad.Rest((1, 16))

 
	# Create the tuplet and append it to `voice_4a`
	tuplet = abjad.Tuplet((4, 5), group)
	voice3.append(tuplet)
abjad.mutate.transpose(voice3, '-P5')

abjad.mutate.transpose(voice_4a, '-P8')
abjad.mutate.transpose(voice_5a, '-P8')

abjad.attach(abjad.Clef('bass'), abjad.select.leaf(voice_4a, 0))
abjad.attach(abjad.Clef('bass'), abjad.select.leaf(voice_5a, 0))


voices = [
	abjad.Voice(main_voice),
	abjad.Voice(voice3),
	abjad.Voice(voice_4a),
	abjad.Voice(voice_5a),
]

STAVEs = []
for voice in voices:
	staff = abjad.Staff([voice])
	make_messadivoce(voice, each=4, dynamic_cycle=[-3, -2, -1, 1, -2])
	abjad.attach(abjad.InstrumentName(abjad.Markup(r'\markup "giggly"')), abjad.select.leaf(staff, 0))
	STAVEs.append(staff)

abjad.attach(abjad.TimeSignature(TIMESIG), abjad.select.leaf(STAVEs[0], 0))    

abjad_SCORE = abjad.Score(STAVEs)
""" 
# If voice_5a is higher than main voice, transpose
for moment in abjad.iterate_vertical_moments(abjad_SCORE):
    # Collect leaves with specific durations
    leaves_1_16 = [leaf for leaf in moment.leaves if leaf.written_duration == abjad.Duration(1, 16)]
    leaves_1_4 = [leaf for leaf in moment.leaves if leaf.written_duration == abjad.Duration(1, 4)]

    # Pair leaves with specific durations using zip
    paired_leaves = list(zip(leaves_1_16, leaves_1_4))
    print(paired_leaves)
    
    for leaf_1_16, leaf_1_4 in paired_leaves:
        # Ensure leaves have written pitches
        if hasattr(leaf_1_16, 'written_pitch') and hasattr(leaf_1_4, 'written_pitch'):
            # Compare the written pitches
            if leaf_1_16.written_pitch < leaf_1_4.written_pitch:
                # Transpose the leaf with 1/16 duration down by an octave
                abjad.mutate.transpose(leaf_1_4, '-P8')
 """
csound_SCORE = 't 0 30'
for staff in abjad_SCORE:
	csound_SCORE += '\n' + Csound_score(staff, tempo=60, time_signature=TIMESIG).process()
csound_SCORE += '\ne'

with open(os.path.join(VERSION_DIR, f'{EXPORT_TITLE}.sco'), 'w') as f:
	f.write(csound_SCORE)

play(csound_SCORE, abjad_SCORE, PREAMBLE, EXPORT_TITLE, VERSION_DIR)
