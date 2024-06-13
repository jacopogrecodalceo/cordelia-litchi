import random
import abjad

# ANSI escape codes for colors
class colors:
	RED = '\033[91m'
	GREEN = '\033[92m'
	YELLOW = '\033[93m'
	BLUE = '\033[94m'
	PURPLE = '\033[95m'
	CYAN = '\033[96m'
	WHITE = '\033[97m'
	END = '\033[0m'  # End color formatting

def __STEP__(string):
	print('='*12)
	print(colors.PURPLE + string + colors.END)
	print('='*12)

def make_messadivoce(voice, each=4, dynamic_cycle=[-5, -4, -3, -2, -1, 1, -2, -3, -4]):
	length = len(dynamic_cycle)
	index = 0
	notes = list(abjad.iterate.leaves(voice, pitched=True))
	for i, note in enumerate(notes):
		if i % each == 0:
			cycle = index % length
			dyn = abjad.Dynamic.dynamic_ordinal_to_dynamic_name(
				dynamic_cycle[cycle]
			)
			abjad.attach(abjad.Dynamic(dyn), note)
			index += 1

	while notes:
		note = notes.pop(0)
		dynamic = next((indicator for indicator in abjad.get.indicators(note) if isinstance(indicator, abjad.Dynamic)), None)
		if dynamic:
			ordinal = dynamic.ordinal
			for n in notes:
				for i in abjad.get.indicators(n):
					if isinstance(i, abjad.Dynamic):
						hairpin = abjad.StartHairpin('<' if i.ordinal > ordinal else '>')
						abjad.attach(hairpin, note)
						break
				else:
					continue
				break
			

def make_dyn_seq(min_value, max_value):

    sequence = []
    current_value = min_value
    
    # Generate sequence until reaching the max_value
    while current_value < max_value:
        sequence.append(current_value)
        current_value += 1
    
    # Add the max_value
    sequence.append(max_value)
    
    # Start decreasing back towards the min_value
    current_value = max_value - 1
    while current_value > min_value:
        sequence.append(current_value)
        current_value -= 1
    
    # Add the min_value at the end
    sequence.append(min_value)

    return [n for n in sequence if n != 0][:-1]

def remove_vertical_octaves(score):
	for vertical_moment in abjad.iterate_vertical_moments(score):
		pitches = [abjad.NamedPitch(note.written_pitch) if hasattr(note, 'written_pitch') else None for note in vertical_moment.leaves]
		if any(pitches.count(x) > 1 for x in pitches):
			seen = set()
			for note in vertical_moment.leaves:
				if hasattr(note, 'written_pitch'):
					if abjad.NamedPitch(note.written_pitch) in seen:
						abjad.mutate.transpose(note, f'{random.choice(["+", "-"])}m3')
					else:
						seen.add(abjad.NamedPitch(note.written_pitch))
    


def find_index_recursive(lst, target, index=[]):
	for i, item in enumerate(lst):
		if item == target:
			return index + [i]
		elif isinstance(item, list):
			found = find_index_recursive(item, target, index + [i])
			if found:
				return found
	return None