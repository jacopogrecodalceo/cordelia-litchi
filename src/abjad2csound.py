import re
import math
import abjad

from src.const import CS_SCO_SEPARATOR


# Define the mappings from string to dB level
DYNs = {
	"fff": -3, 	# 0.7079457843841379
	"ff": -9, 	# 0.35481338923357547
	"f": -13,	# 0.22387211385683395
	"mf": -15,	# 0.1778279410038923
	"mp": -21,	# 0.08912509381337455
	"p": -25,	# 0.05623413251903491
	"pp": -27,	# 0.0446683592150963
	"ppp": -31,	# 0.028183829312644536
	"pppp": -35	# 0.01778279410038923
}

def convert_seconds(seconds):
    hours = seconds // (60*60)
    seconds %= (60*60)
    minutes = seconds // 60
    seconds %= 60
    return "%02i:%02i:%02i" % (hours, minutes, seconds)

def db2amp(db):
	return 10 ** (db / 20)

def amp2db(amp):
	return round(20 * math.log10(amp))

def interpolate(start, end, n, direction):
	if direction == "<":
		step = (end - start) / n
		interpolated_values = [start + step * i for i in range(n)]
	elif direction == ">":
		step = (start - end) / n
		interpolated_values = [start - step * i for i in range(n)]
	else:
		raise ValueError("Invalid direction hairpin for interpolation")
	return interpolated_values

class Csound_score():
	
	def __init__(self, staff, tempo=60, time_signature=(4, 4)) -> None:

		# Argouments
		self.staff = staff
		assert isinstance(self.staff, abjad.Staff), 'First arg of Score() class is not an abjad.Staff instance'
		for leaf in abjad.iterate.components(self.staff):
			for i in abjad.get.indicators(leaf):
				if isinstance(i, abjad.InstrumentName):
					self.instr = 'i ' + i.markup.string.split(r'\markup')[1].strip()
					break
		self.tempo = tempo
		self.time_signature = time_signature

		# Derived
		self.quarter_note_in_second = 60 / tempo * time_signature[1]
		self.abs_time = 0
		self.cs_score = []

		# Default
		self.dyn = db2amp(DYNs['mf']) # beginning dynamic
		self.env = 'classic'
		self.hairpin_interp = []

		self.components = list(abjad.iterate.components(self.staff))
  
		for component in self.components:
			if isinstance(component, abjad.Voice):
				self.name = component.name
				break

	def get_dyn(self): 
		if isinstance(self.indicator, abjad.Dynamic):
			self.dyn = db2amp(DYNs[self.indicator.name])

	def get_hairpin(self):
		if isinstance(self.indicator, abjad.StartHairpin):
			self.hairpin_direction = self.indicator.shape

			def find_end():
				index = 0
				for leaf in self.components:
					if not isinstance(leaf, abjad.Tuplet):
						index += 1
						for indicator in abjad.get.indicators(leaf):
							if isinstance(indicator, abjad.Dynamic):
								self.hairpin_end = DYNs[indicator.name]
								return index
				return False

			index = find_end()
			if index:
				self.hairpin_interp = interpolate(amp2db(self.dyn), self.hairpin_end, index, self.hairpin_direction)
				
	def get_env(self):
		if self.tag[0] == 'env':
			match = re.search(r'"([^"]*)"', self.indicator.string)
			if match:
				self.env = match.group(1)
			else:
				print('env not found!')

	def get_indicators(self):
		wrappers = abjad.get.wrappers(self.component)
		for wrapper in wrappers:
			self.indicator = wrapper.indicator
			self.tag = wrapper.tag.words()
			self.get_dyn()
			self.get_hairpin()
			self.get_env()
		if self.hairpin_interp:
			self.dyn = db2amp(self.hairpin_interp.pop(0))
   
	def process(self):
		while self.components:
			component = self.components.pop(0)
			self.component = component
			if isinstance(component, abjad.Tuplet):
	
				leaves = abjad.select.leaves(component)
				multiplier = abjad.Duration(component.multiplier)
    
				for leaf in leaves:
        
					ratio_dur = leaf.written_duration * multiplier
					dur = float(self.quarter_note_in_second * ratio_dur)
		
					if isinstance(leaf, abjad.Note):
						for i, component in enumerate(self.components):
							if self.components[i] == leaf:
								self.component = component
								self.components.pop(i)
								self.get_indicators()
								break
						self.cs_score.append([
							self.instr,
							self.abs_time,
							dur,
							self.dyn,
							abjad.NumberedPitch(leaf).hertz
						])
						self.abs_time += dur
		
					elif isinstance(leaf, abjad.Chord):
						for i, component in enumerate(self.components):
							if self.components[i] == leaf:
								self.component = component
								self.get_indicators()
								self.components.pop(i)
								break
		
						for note in leaf.note_heads:
							self.cs_score.append([
								self.instr,
								self.abs_time,
								dur,
								self.dyn,
								abjad.NumberedPitch(note).hertz
							])

						self.abs_time += dur
		
					elif isinstance(leaf, abjad.Rest):
						for i, component in enumerate(self.components):
							if self.components[i] == leaf:
								self.component = component
								self.get_indicators()
								self.components.pop(i)
								break
						self.abs_time += dur

			elif isinstance(component, abjad.Note | abjad.Chord | abjad.Rest):
	
				self.get_indicators()

				ratio_dur = component.written_duration
				dur = float(self.quarter_note_in_second * ratio_dur)
	
				if isinstance(component, abjad.Note):
					self.cs_score.append([
						self.instr,
						self.abs_time,
						dur,
						self.dyn,
						abjad.NumberedPitch(component).hertz
					])

				elif isinstance(component, abjad.Chord):
					for note in component.note_heads:
						self.cs_score.append([
							self.instr,
							self.abs_time,
							dur,
							self.dyn,
							abjad.NumberedPitch(note).hertz
						])
				
				#elif isinstance(component, abjad.Rest):
				self.abs_time += dur
	
		score = CS_SCO_SEPARATOR
		score += f'; Voice: {self.name}'
		score += CS_SCO_SEPARATOR
  
		for line in self.cs_score:
			# Format each element in the sublist
			formatted_elements = []
			for p in line:
				if isinstance(p, float) and p != 0:
					# Format the float to have 5 decimal places, left-justified in a 15-character wide field
					formatted_element = "{:<10.5f}".format(p)
				else:
					# Format the element as a string, left-justified in a 15-character wide field
					formatted_element = "{:<10}".format(p)
     
				if line.index(p) == 1:
					formatted_time = convert_seconds(p)
					line.append(f'; {formatted_time}')
				formatted_elements.append(formatted_element)
			
			# Join the formatted elements with a tab character
			formatted_row = '\t\t'.join(formatted_elements)
			
			# Add the formatted row to the score with a newline character
			score += formatted_row + '\n'

 
		return score
