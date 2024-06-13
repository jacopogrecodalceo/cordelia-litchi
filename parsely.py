
# Path to your LilyPond file
lilypond_file = "/Users/j/Documents/PROJECTs/der Mond /score/ly/_main.ly"

import quickly
from quickly.dom import lily
from quickly.dom.scope import Scope

import abjad

d = quickly.load(lilypond_file)
m = d.get_transform(True)
s = Scope(d)

scores = []
for score in m // lily.Score:
	scores.append(score)

main_score = scores[0]
for part in main_score // lily.IdentifierRef:
	part_scope = part.get_value(s)
	for element in part_scope:
		if isinstance(element, lily.Note):
			element.dump()
			for art in element // lily.Tie:
				print(art)
