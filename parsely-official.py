from src.ly2csound import Litchi
from _csound.play import play
from src.const import *

# Path to your LilyPond file
#lilypond_file = "/Users/j/Documents/CLI/cordelia-ly/_/_ex/240601-1914-cicogne.ly"
lilypond_file = "/Users/j/Documents/PROJECTs/der Mond /score/ly/_main.ly"

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

litchi = Litchi('nederlands')
#litchi = Litchi('english')
litchi.load_score(lilypond_file)
#litchi.dump()
litchi.process()


csound_SCORE = 't 0 150'
csound_SCORE += '\n' + litchi.make_score()
csound_SCORE += '\ne'

score = True
if score:
	with open(os.path.join(VERSION_DIR, f'{EXPORT_TITLE}.sco'), 'w') as f:
		f.write(csound_SCORE)

#print(csound_SCORE)
play(csound_SCORE, start_from=0)

""" csound_SCORE = 't 0 110'
csound_SCORE += '\n' + Csound_score(lilypond_file).process()
csound_SCORE += '\ne'

with open(os.path.join(VERSION_DIR, f'{EXPORT_TITLE}.sco'), 'w') as f:
	f.write(csound_SCORE)

#print(csound_SCORE)
play(csound_SCORE) """
