import re
import abjad
import os
from src.const import *

# Path to your LilyPond file
#lilypond_file = "/Users/j/Documents/CLI/cordelia-ly/_/_ex/240601-1914-cicogne.ly"
lilypond_file = "/Users/j/Documents/CLI/cordelia-litchi/_version/_saved/quarta/240610-1602/240610-1602-do_i_dinner.ly"

TITLE = 'cicogne'
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

directory = os.path.dirname(lilypond_file)
name = os.path.basename(lilypond_file)
basename, extension = os.path.splitext(name)

with open(lilypond_file, 'r') as f:
	lines = f.readlines()

""" for i, line in enumerate(lines):
	if 'include' in line:
		lines[i] = line.replace('".', f'"{directory}')
		#print(lines[i])
container = abjad.LilyPondFile(lines)
print(container) """

unsafe_words = (
    'include',
    'accidentalStyle',
    'layout',
    'midi'
)

re_words = {
	r'\\after \d+': '',
}

index = next((i for i, line in enumerate(lines) if 'score' in line), None)

safe_lines = []
for line in lines[index:]:
	if not any(word in line for word in unsafe_words):
		for word, replacement in re_words.items():
			line = re.sub(word, replacement, line)
			print(line)
		safe_lines.append(line.strip())
			
parser = abjad.parser.LilyPondParser()
container  = parser('\n'.join(safe_lines))
for c in container.items:
	for a in abjad.iterate.components(c):
		print(a)
#abjad.show(container)