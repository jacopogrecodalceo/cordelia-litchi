import os
import sys

from datetime import datetime 

DATE = datetime.today().strftime('%y%m%d-%H%M')

CS_SCO_SEPARATOR = '\n; ' + '='*82 + '\n'

THIS_DIR = os.path.dirname(os.path.dirname(__file__))

VERSION_DIR = os.path.join(THIS_DIR,'_version')
LY_DIR = os.path.join(THIS_DIR,'_ly')
CS_DIR = os.path.join(THIS_DIR,'_csound')


main_module = sys.modules['__main__']
main_script_path = os.path.abspath(main_module.__file__)
main_script_name = os.path.basename(main_script_path)
main_script_basename, main_script_extension = os.path.splitext(main_script_name)

CREATION_DIR = os.path.join(VERSION_DIR, main_script_basename)
if not os.path.exists(CREATION_DIR):
    os.mkdir(CREATION_DIR)

with open(os.path.join(CS_DIR, 'main.orc'), 'r') as f:
	ORC = f.read()

OCTAVE_COMPENSATION = 3

# Define the mappings from string to dB level
DYNs = {
	"fff": -3, 	# 0.7079457843841379
	"ff": -9, 	# 0.35481338923357547
	"f": -13,	# 0.22387211385683395
	"mf": -17,	# 0.1778279410038923
	"mp": -21,	# 0.08912509381337455
	"p": -25,	# 0.05623413251903491
	"pp": -27.5,	# 0.0446683592150963
	"ppp": -29,	# 0.028183829312644536
	"pppp": -31,	# 0.01778279410038923
 
	"sfz": -5,	# 0.22387211385683395
	"fp": -7,	# 0.22387211385683395
}

DYN_IDENTIFIERs = {
	'psempre': 'p',
	'mpsenzacresc': 'mp',
	'fclavecin': 'mf'
}

def make_preamble(TITLE, COMPOSER):
	header_lines = [
		'\header {',
		f'title = \markup "{TITLE}"',
		f'composer = "{COMPOSER}"',
		f'tagline = "{COMPOSER}"',
		'}'
	]

	header = '\n'.join(header_lines)


	PREAMBLEs = [
		header,
		f'\include "{os.path.join(LY_DIR, "paper.ily")}"',
		f'\include "{os.path.join(LY_DIR, "layout.ily")}"'
	]

	return '\n'.join(PREAMBLEs)
