import random
import abjad
import os

from _csound.play import play
from src.utils import make_messadivoce

from src.abjad2csound import Csound_score
from src.const import *

TITLE = 'rainy, sandy, but spongy'
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
CHOICE = 5

if CHOICE == 1:

	TIMESIG = (4, 4)
	seqs1 = ["e'8 b'4. f'8 a'4."]
	seqs2 = ["e'8 e'4. f'8 e'4.", "e'8 e'4. e'8 e'4.", "e'16 f'16 e'4. e'8 e'4."]
	anacrusis = 0

elif CHOICE == 2:

	TIMESIG = (4, 16)
	seqs1 = ["e'8 b'4. f'8 a'4."]
	seqs2 = ["e'8 e'4. f'8 e'4.", "e'8 e'4. e'8 e'4.", "e'16 f'16 e'4. e'8 e'4."]
	anacrusis = 0
 
elif CHOICE == 3:

	TIMESIG = (4, 16)
	seqs1 = ["e'16 b'16 f'8"]
	seqs2 = ["e'32 f'32 e'16 d'16 a'8 bf'8"]
	anacrusis = 0
 
elif CHOICE == 4:
    
	TIMESIG = (4, 16)
	seqs1 = ["e'8 b'4. f'8 a'4.", "e'8 b'4. fs'8 a'4.", "d'8 c''4. e'8 a'4.", "e'8 d''4. d'8 bf'4."]
	seqs2 = ["e'8 e'4. f'8 e'4.", "e'8 e'4. e'8 e'4.", "e'16 f'16 e'4. e'8 e'4."]
	anacrusis = 0

elif CHOICE == 5:

	TIMESIG = (4, 4)
	seqs1 = ["c''8 g''4 d'8 e''2", "bf''8 a''4 e'8 f''2", "d''16. e''32 f''4 e'8 f''2", "c''16 d''16 c''16 g''16 c'8 d'8 e''2"]
	seqs2 = ["e'8 e''4. f'8 e'4.", "e''8 e'4. e'8 e'4.", "e'16 f'16 e'4. e'8 e'4."]
	anacrusis = 0

TIMES = 4

p1 = [[abjad.Note(leaf) if not leaf.startswith('r') else abjad.Rest(leaf) for leaf in seq.split()] for seq in seqs1]
p2 = [[abjad.Note(leaf) if not leaf.startswith('r') else abjad.Rest(leaf) for leaf in seq.split()] for seq in seqs2]

seq = []

for i in range(max([len(p1), len(p2)])):
	length = len(seq)
	if i < len(p1):
		seq.extend(abjad.mutate.copy(p1[i]))
	if i < len(p2):
		seq.extend(abjad.mutate.copy(p2[i]))
	abjad.attach(abjad.bundle(abjad.StartPhrasingSlur(), r"- \tweak color #red"), seq[length])
	abjad.attach(abjad.StopPhrasingSlur(), seq[-1])
		

for _ in range(TIMES-1):
	length = len(seq)
	seq.extend(abjad.mutate.copy(random.choice(p1)))
	seq.extend(abjad.mutate.copy(random.choice(p2)))
	abjad.attach(abjad.bundle(abjad.StartPhrasingSlur(), r"- \tweak color #red"), seq[length])
	abjad.attach(abjad.StopPhrasingSlur(), seq[-1])

seq = abjad.sequence.flatten([abjad.mutate.copy(seq) for _ in range(TIMES)])

voice = abjad.Voice(seq)
abjad.mutate.transpose(voice, '+P8')
#staff = abjad.Staff([voice])

STAVEs = []
for i in range(5):
	staff = abjad.Staff([abjad.mutate.copy(voice)])
	#make_messadivoce(voice, each=4*(i+1), dynamic_cycle=[-3, -2, -1, 1, -2])
	abjad.attach(abjad.InstrumentName(abjad.Markup(r'\markup "giggly"')), abjad.select.leaf(staff, 0))
	STAVEs.append(staff)

abjad.mutate.transpose(STAVEs[1], '-P5')
abjad.mutate.transpose(STAVEs[2], '-M9')
abjad.mutate.transpose(STAVEs[3], '-P12')
abjad.mutate.transpose(STAVEs[4], '-P15')

for i, staff in enumerate(STAVEs[1:]):
	staff.insert(0, 'r8')
 
from_staff = 2
for index_staff, staff in enumerate(STAVEs[from_staff:]):
	print('-STAFF-'*12)
	new_staff = []
	measure_count = 0
	inside_measure = abjad.Duration(TIMESIG)
 
	# Skip anacrusis
	index = 0
	leaves = list(abjad.iterate.leaves(staff))
	for leaf in leaves:
		if 	anacrusis > 0 and index == 0:
			new_staff.append(abjad.Rest('r8'))
			index += 1
		elif measure_count < 10:
			if inside_measure == 0: inside_measure = abjad.Duration(TIMESIG)
   
			measure_left = (abjad.Duration(TIMESIG) - inside_measure) % abjad.Duration(TIMESIG)
			if measure_left == 0: measure_left = abjad.Duration(TIMESIG)

			dur = leaf.written_duration * 2 ** (index_staff+1)

			durs = []

			print(f"dur: {dur}, inside_measure: {inside_measure}, measure_left: {measure_left}, durs: {durs}")
			if dur > measure_left:
				durs.append(measure_left)
				while dur > measure_left:
					dur = dur - measure_left
					inside_measure = (inside_measure + measure_left) % abjad.Duration(TIMESIG)
					if inside_measure == 0: inside_measure = abjad.Duration(TIMESIG)
					measure_left = (abjad.Duration(TIMESIG) - inside_measure) % abjad.Duration(TIMESIG)
					if measure_left == 0: measure_left = abjad.Duration(TIMESIG)
					durs.append(measure_left)
			print(f"inside_measure: {inside_measure}, measure_left: {measure_left}, durs: {durs}")
   
			if durs:
				for j, dur in enumerate(durs):
					new_leaf = leaf.__class__()
					new_leaf.written_duration = dur
					if hasattr(new_leaf, 'written_pitch'):
						new_leaf.written_pitch = leaf.written_pitch
					
					new_staff.append(new_leaf)
					inside_measure = (inside_measure + dur) % abjad.Duration(TIMESIG)
					measure_count += dur

			else:
				new_leaf = leaf.__class__()
				new_leaf.written_duration = dur
				if hasattr(new_leaf, 'written_pitch'):
					new_leaf.written_pitch = leaf.written_pitch
				
				new_staff.append(new_leaf)
				inside_measure = (inside_measure + dur) % abjad.Duration(TIMESIG)
				measure_count += dur

		print('-'*12)
	voice = abjad.Voice(new_staff)
	#print(STAVEs[index_staff+from_staff])
	STAVEs[index_staff+from_staff] = abjad.Staff([voice])
	abjad.attach(abjad.InstrumentName(abjad.Markup(r'\markup "repuck"')), abjad.select.leaf(STAVEs[index_staff+from_staff], 0))
	#abjad.attach(abjad.Dynamic('mp'), abjad.select.leaf(STAVEs[index_staff+from_staff], 1))

#abjad.attach(abjad.Clef('bass'), abjad.select.leaf(STAVEs[-3], 0))
abjad.attach(abjad.Clef('bass'), abjad.select.leaf(STAVEs[-2], 0))

abjad.attach(abjad.Clef('bass'), abjad.select.leaf(STAVEs[-1], 0))

abjad.attach(abjad.LilyPondLiteral('\partial 8'), abjad.select.leaf(STAVEs[0], 0))
abjad.attach(abjad.TimeSignature(TIMESIG), abjad.select.leaf(STAVEs[0], 0))

min_length = min([len(list(abjad.iterate.leaves(staff))) for staff in STAVEs])
    


abjad_SCORE = abjad.Score(STAVEs)

csound_SCORE = 't 0 60'
for staff in abjad_SCORE:
	csound_SCORE += '\n' + Csound_score(staff, tempo=60, time_signature=TIMESIG).process()
csound_SCORE += '\ne'

with open(os.path.join(VERSION_DIR, f'{EXPORT_TITLE}.sco'), 'w') as f:
    f.write(csound_SCORE)

play(csound_SCORE, abjad_SCORE, PREAMBLE, EXPORT_TITLE, VERSION_DIR)