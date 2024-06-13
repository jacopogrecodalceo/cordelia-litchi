import math


def ss2hhmmss(seconds):
	hours = seconds // (60*60)
	seconds %= (60*60)
	minutes = seconds // 60
	seconds %= 60
	return "%02i:%02i:%02i" % (hours, minutes, seconds)

def db2amp(db):
	max_val = 0
	min_val = -33
	return (db - min_val) / (max_val - min_val)

def amp2db(amp):
	return round(20 * math.log10(amp))



