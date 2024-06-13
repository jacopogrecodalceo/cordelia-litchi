from src.ly2csound import Litchi
from _csound.play import play
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

INSTRUMENT_NAME_ORDER = {
	1: 'giggly',
	2: 'pure',
	3: 'repuck',
	4: 'repuck',
	5: 'repuck',
	6: 'repuck'
}

litchi = Litchi(INSTRUMENT_NAME_ORDER, language='english', human_onset=1/32, human_dur=0)
litchi.load_score(lilypond_file)
litchi.process()


csound_SCORE = 't 0 50'
csound_SCORE += '\n' + litchi.make_score()
csound_SCORE += '\ne'

with open(f'{EXPORT_PATH}.sco', 'w') as f: f.write(csound_SCORE)
 
play(csound_SCORE, start_from=0, title=EXPORT_TITLE, export=False, export_path=EXPORT_PATH)
