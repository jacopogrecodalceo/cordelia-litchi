import os
import ctcsound
from src.const import ORC

OPTIONs = [
    '--nchnls=2',
    '--0dbfs=1',
    '--sample-rate=48000',
    '--ksmps=16',
    '--env:INCDIR=/Users/j/Documents/PROJECTs/CORDELIA/cordelia',
    '-3',
    '--limiter',
    '-m0d' # Remove all messages
]

def play(csound_SCORE, start_from=0, title=None, export=False, export_path=None, composer="jacopo greco d'alceo"):
	cs = ctcsound.Csound()
	
	OPTIONs.append(f'-+id_artist="{composer}"')
 
	command_path = f'{export_path}.command'
	with open(command_path, 'w') as f:
		f.write('cd "$(dirname "$0")" \n')
		f.write(f'csound {" ".join(OPTIONs)} -o{title}.wav "{title}.orc" "{title}.sco"')
	os.chmod(command_path, 0o744)

	if export:
		OPTIONs.append(f'-o{export_path}.wav')
	else:
		OPTIONs.append('-odac')
	for opt in OPTIONs:
		cs.setOption(opt)


	retval = cs.evalCode(ORC)
	if retval == 0:
		with open(f'{export_path}.orc', 'w') as f:
			f.write(ORC)

		cs.compileOrc(ORC)
		cs.readScore(f'a 0 0 {start_from}\n' + csound_SCORE)

		cs.start()
		cs.perform()
		cs.cleanup()
		cs.reset()
		del cs
	else:
		del cs
		raise ValueError('Csound orchestra failed to compile')
