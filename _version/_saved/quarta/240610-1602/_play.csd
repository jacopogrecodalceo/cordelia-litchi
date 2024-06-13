<CsoundSynthesizer>
<CsInstruments>
massign 1, nstrnum("yin")
massign 2, nstrnum("pure")
massign 3, nstrnum("repuck")
massign 4, nstrnum("repuck")

giDYN init 1

#define env #cosseg:a(0, .015, 1, idur-.03, 1, .015, 0)#

#define couleurs #
if random:i(0, 1) > .75 then
	prints "%s, COULEURs!\n", nstrstr(p1)
	ionset_couleur random 0, idur/2
	schedule p1, ionset_couleur, random:i(idur/32, idur), idyn/2, icps*3/2
	schedule p1, ionset_couleur*2, random:i(idur/32, idur), idyn/2, icps*2
	schedule p1, ionset_couleur*3, random:i(idur/32, idur), idyn/2, icps*3
endif
#


#include "./csound_cordelia/1-character/1-MACRO.orc"
#include "./csound_cordelia/1-character/2-GLOBAL_VAR.orc"
#include "./csound_cordelia/1-character/3-FORMAT.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/saw.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/sine.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/square.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/tri.orc"

instr repuck

	idur	init p3
	idyn	ampmidi 1
	icps	cpsmidi

	idyn /= 3

	until icps < 15000 do
		icps /= 2
	od

	#define env #cosseg:a(0, .005, 1, idur-random:i(idur/2, .01), 1, .005, 0)*idyn#

	ipanfreq	init random:i(-.25, .25)

	arep	repluck random:i(.015, .35), 1, icps + random:i(-ipanfreq, ipanfreq), randomh:k(.25, .95, random:i(.05, .15)), random:i(.05, .65), poscil(1, random:i(.05, .25),  gisquare)

	anoi		fractalnoise 1/2, expseg(.95, idur, .05)

	ilpt		init 1/icps
	krvt		cosseg idur, idur, idur/random:i(2, 12)
	acom		comb anoi/16+arep, krvt, ilpt

	acom		balance2 acom, arep

	aout		dcblock2 arep+acom
	aout		buthp aout/2, icps - icps/12
	amoog		moogladder2 aout, limit(icps*2+icps*idyn*12, icps, 15000), .5+jitter:k(.25, 3/idur, 1/idur)
	amoog		balance2 amoog, aout

	chnmix aout*$env, "mod_ch1"
	chnmix aout*$env, "mod_ch2"

	outs amoog*$env, amoog*$env
	;$couleurs
endin



;gixylo[]  fillarray 1, 3.932, 9.538, 16.688, 24.566, 31.147
;gixylo_vibes[] fillarray 1, 3.997, 9.469, 15.566, 20.863, 29.440

gixylo_ft           ftgen		0, 0, 6, -2, 1, 3.932, 9.538, 16.688, 24.566, 31.147
gixylo_vibes		ftgen		0, 0, 6, -2, 1, 3.997, 9.469, 15.566, 20.863, 29.440

gixylo_morf         ftgen		0, 0, 2, -2, gixylo_ft, gixylo_vibes
gixylo_dummy	    ftgen		0, 0, 6, 10, 1

instr xylo

	idur	init p3
	idyn	init p4;*giDYN/24
	icps init p5

	until icps < 15000 do
		icps /= 2
	od

	#define env #cosseg:a(0, .005, 1, idur-random:i(idur/2, .01), 1, .005, 0)*idyn#

	ienv_max    init idur
	ienv_min    init -.75        ;the minimum for the audible
	ienvvar     init .05
	ifreq_max   init 20$k

				ftmorf limit(idur, 0, 12)/2, gixylo_morf, gixylo_dummy

	;-------OSCIL01            
	a1      oscil3  idyn*$env, icps*tab_i(0, gixylo_dummy), gisine

	;-------OSCIL02
	a2      oscil3  idyn*$env, icps*tab_i(1, gixylo_dummy), gisine


	;-------OSCIL03
	ir3     init icps*tab_i(2, gixylo_dummy)
	if      ir3<ifreq_max then
		idyn		= p4/2

		a3      oscil3  idyn*$env, ir3, gisine

	;-------OSCIL04
		ir4     init icps*tab_i(3, gixylo_dummy)
		if      ir4<20$k then
			idyn		= p4/2

			a4      oscil3  idyn*$env, ir4, gisine

	;-------OSCIL05
			ir5     init icps*tab_i(4, gixylo_dummy)
			if      ir5<ifreq_max then
				idyn		= p4/2

				a5      oscil3  idyn*$env, ir5, gisine

	;-------OSCIL06
				ir6     init icps*tab_i(5, gixylo_dummy)
				if      ir6<ifreq_max then
					idyn		= p4/2

					a6      oscil3  idyn*$env, ir6, gisine
				endif
			endif
		endif
	endif

	aout        =     a1 + a2 + a3 + a4 + a5 + a6
	amoog moogladder2 aout, icps+icps*idyn, .5+jitter:k(.35, 5/p3, 1/p3)
	;amoog /= 2
	chnmix amoog, "mod_ch1"
	chnmix amoog, "mod_ch2"

	outs amoog, amoog
	;$couleurs
endin


instr yin
	idur	init p3
	idyn	ampmidi 1
	icps	cpsmidi
	kcps = icps
	ir1 = idur/9
	ir2 = idur*7/9
	ir3 = idur*2/9
	idyn /= 3
	; two saw oscillators slightly detuned
	asig = vco2(idyn, kcps)
	asig += vco2(idyn, kcps * semitone(random:i(.023, .05)))
	asig *= 1/8

	;; oct value: 50% keyboard tracking + base 4 + aenv modulation between 1-2 octaves
	asig = zdf_2pole(asig, cpsoct(($env * random:i(1,2)) + 4 + (octcps(icps) * .5)), 1)

	;; extra env for declicking
	asig *= linen:a(1, 0.01, idur, .01)

	outs asig, asig
endin

instr pure
	idur	init p3
	idyn	ampmidi 1
	icps	cpsmidi
	kcps = icps
	until kcps < 15000 do
		kcps /= 2
	od
	idyn /= 3
	ipanfreq	init random:i(-.25, .25)
	a1 oscili idyn, kcps+jitter(kcps/50, 3/idur, 1/idur), gitri
	arep1	repluck random:i(.015, .35), 1, icps*4 + random:i(-ipanfreq, ipanfreq), randomh:k(.25, .95, random:i(.05, .15)), random:i(.05, .65), poscil(1, random:i(.05, .25),  gisquare)
	a2 oscili idyn, kcps+jitter(kcps/50, 3/idur, 1/idur), gitri
	arep2	repluck random:i(.015, .35), 1, icps*4 + random:i(-ipanfreq, ipanfreq), randomh:k(.25, .95, random:i(.05, .15)), random:i(.05, .65), poscil(1, random:i(.05, .25),  gisquare)

	aout1 = (a1+arep1*2)/3
	aout2 = (a2+arep2*2)/3

	amoog1 moogladder2 aout1, kcps+kcps*idyn*5, .5
	amoog2 moogladder2 aout2, kcps+kcps*idyn*5, .5

	;chnmix aout1*$env, "mod_ch1"
	;chnmix aout2*$env, "mod_ch2"

	outs amoog1*$env, amoog2*$env
	;$couleurs
endin



</CsInstruments>
<CsScore>
f0 z
</CsScore>
</CsoundSynthesizer>



