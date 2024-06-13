giDYN init 1

#define env #cosseg:a(0, .015, 1, idur-.03, 1, .015, 0)#

#define couleurs #
if random:i(0, 1) > .75 then
	prints "%s, COULEURs!\n", nstrstr(p1)
	ionset_couleur random 0, idur/2
	schedule p1, ionset_couleur, random:i(idur/32, idur), idyn/2, icps*3/2, 0, 0, 0
	schedule p1, ionset_couleur*2, random:i(idur/32, idur), idyn/2, icps*2, 0, 0, 0
	schedule p1, ionset_couleur*3, random:i(idur/32, idur), idyn/2, icps*3, 0, 0, 0
endif
#

#define gliss #
	icps	init p5
	igliss_onset init p6
	igliss_dur init p7
	igliss_end init p8
	ktempo tempoval
	if igliss_end != 0 then
		prints "GLISSANDO %s \n", nstrstr(p1)
		prints "%f idyn, ", idyn
		prints "%f idur, ", idur
		prints "%f cps\n", icps
		prints "%f igliss_onset ", igliss_onset
		prints "%f igliss_dur\n", igliss_dur

		if igliss_onset != 0 then
			kcps cosseg icps, igliss_onset, icps, igliss_dur, igliss_end
			;printk2 kcps
		else
			kcps cosseg icps, igliss_dur, igliss_end
			;printk2 kcps
		endif
	else
		kcps init icps
	endif
#

#include "./csound_cordelia/1-character/1-MACRO.orc"
#include "./csound_cordelia/1-character/2-GLOBAL_VAR.orc"
#include "./csound_cordelia/1-character/3-FORMAT.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/saw.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/sine.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/square.orc"
#include "./csound_cordelia/2-head/GEN/2-bipolar/tri.orc"

giTEMPO init 1

instr tempo_init
	kt tempoval
		giTEMPO i kt
		print giTEMPO
endin

instr get_tempo
	if metro:k(1) == 1 then
		schedulek "tempo_init", 0, 1/kr
	endif
endin
alwayson("get_tempo")

instr seconds
	kseconds times

	khours = kseconds / (60*60)
	kseconds = kseconds % (60*60)
	kminutes = kseconds / 60
	kseconds = kseconds % 60
	printks "------------------------------------------------------------%02i:%02i:%02i\n", 1, khours, kminutes, kseconds
	
endin
	alwayson("seconds")


opcode tie_status,i,0

	itie tival

	if (itie == 0 && p3 < 0) ithen
		; this is an initial note within a group of tied notes
		itiestatus = 0
		
	elseif (p3 < 0 && itie == 1) ithen
		; this is a middle note within a group of tied notes 
		itiestatus = 1

	elseif (p3 > 0 && itie == 1) ithen
		; this is an end note out of a group of tied notes
		itiestatus = 2

	elseif (p3 > 0 && itie == 0) ithen
		; this note is a standalone note
		itiestatus = -1

	elseif (p3 > 0 && itie == 0 && p5 < 0) ithen
		; this note is a standalone note
		itiestatus = 3


	endif  

		xout    itiestatus

endop

instr ytie

	p3	= (p3 < 0) ? p3 - 1 : p3 + 1

	idur	= abs(p3)
	iamp	init p4/3
	icps	abs p5

	;kpchline 	line ipch, p3, ipch2


	itiestatus tie_status
	iskip 	tival

	tigoto skipInit
		ioldcps		init icps
	skipInit:

	;print itiestatus

	if (itiestatus == -1) then
		kenv		adsr	.05, .05, .9, .05
		kcpsline	init icps
		kamp		init iamp

	elseif (itiestatus == 0) then	
		kenv		linseg	0, .05, 1,  .2, 1
		kcpsline	init icps
		kamp		init iamp
		ioldcps 	= icps
		ioldamp	= iamp

	elseif (itiestatus == 1) then	
		kenv 		init 1
		kcpsline	line ioldcps, idur, icps
		kamp		line ioldamp, idur, iamp
		ioldcps 	= icps
		ioldamp	= iamp

	elseif (itiestatus == 2) then
		kenv linseg	1, idur - .05, 1, .05, 0
		kcpsline	line ioldcps, idur, icps
		kamp		line ioldamp, idur, iamp

	elseif (itiestatus == 3) then
		kenv 		init 1
		kcpsline	line ioldcps, idur, icps
		kamp		line ioldamp, idur, iamp
		ioldcps 	= icps
		ioldamp	= iamp
		
	endif

	;print itiestatus

	aout	vco2 	1, kcpsline, iskip
	aout	moogladder2		aout, 3000, 0.5, iskip

	aout = aout * iamp * kenv

	outall aout


endin



instr giggly
	idur	init p3
	idyn	init p4
	$gliss

	until kcps < 15000 do
		kcps /= 2
	od

	a1 oscili 1, kcps*2+jitter(kcps/75, 3/idur, 1/idur), gitri
	a2 foscil 1, kcps+oscili:k(kcps/cosseg(75, idur, 500), 3/idur), 1, .5, cosseg(random:i(.5, .75), idur/4, 0)

	a3 oscili 1, kcps*2+jitter(kcps/75, 3/idur, 1/idur), gitri
	a4 foscil 1, kcps+oscili:k(kcps/cosseg(75, idur, 500), 3/idur), 1, .5, cosseg(random:i(.5, .75), idur/4, 0)

	aout1 = (a1+a2)*.5+lfo:a(.5, random:i(2.95, 9.05)/p3)*cosseg:a(0, idur/5, 1, idur*3/5, 1, idur/5, 0)
	aout2 = (a3+a4)*.5+lfo:a(.5, random:i(2.95, 9.05)/p3)*cosseg:a(0, idur/5, 1, idur*3/5, 1, idur/5, 0)

	aout1 *= idyn/4
	aout2 *= idyn/4

	amoog1 moogladder2 aout1, limit(kcps+kcps*idyn*9, kcps, 20000), .5+jitter:k(.35, 3/idur, 1/idur)
	amoog2 moogladder2 aout2, limit(kcps+kcps*idyn*9, kcps, 20000), .5+jitter:k(.35, 3/idur, 1/idur)

	chnmix aout1*$env, "mod_ch1"
	chnmix aout2*$env, "mod_ch2"

	outs amoog1*$env, amoog2*$env
	$couleurs
endin

instr repuck

	idur	init p3
	p3 init p3*2
	idyn	init p4*giDYN/6
	icps init p5
	$gliss

	until icps < 15000 do
		icps /= 2
	od

	#define env #cosseg:a(0, .005, 1, idur-random:i(idur/2, .01), 1, .005, 0)*idyn#

	ipanfreq	init random:i(-.25, .25)

	arep	repluck random:i(.015, .35), 1, icps + random:i(-ipanfreq, ipanfreq), randomh:k(.25, .95, random:i(.05, .15)), random:i(.05, .65), poscil(1, random:i(.05, .25),  gisquare)

	anoi		fractalnoise 1/2, expseg(.95, idur, .05)

	ilpt		init 1/icps
	krvt		cosseg idur, idur, idur/random:i(2, 12)
	acom		comb anoi+arep, krvt, ilpt

	acom		balance2 acom, arep

	aout		dcblock2 arep+acom
	aout		buthp aout/2, icps - icps/12
	amoog		moogladder2 aout, limit(icps*2+icps*idyn*12, icps, 15000), .5+jitter:k(.25, 3/idur, 1/idur)
	amoog		balance2 amoog, aout

	chnmix aout*$env, "mod_ch1"
	chnmix aout*$env, "mod_ch2"

	outs amoog*$env, amoog*$env
	$couleurs
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
	$gliss

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
	$couleurs
endin

instr pure2
	idur	init p3
	idyn	init p4
	$gliss
	print idyn

	until kcps < 15000 do
		kcps /= 2
	od

	a1 oscili idyn, kcps+jitter(kcps/50, 3/idur, 1/idur), gitri
	a2 oscili idyn, kcps+jitter(kcps/50, 3/idur, 1/idur), gitri

	outs a1*$env, a2*$env
	;$couleurs
endin

instr yin
	idur	init p3
	idyn	init p4/2
	$gliss

	ir1 = idur/9
	ir2 = idur*7/9
	ir3 = idur*2/9

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
	idyn	init p4*2
	$gliss

	until kcps < 15000 do
		kcps /= 2
	od

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


opcode cordelia_shimmer_reverb, a, akkkk
	ain, ktime, kfb, kratio, kwet xin

	; Author: Steven Yi
	imaxdel     init 15000

	; pre-delay
	adel        vdelay3 ain*kwet, a(ktime*1000), imaxdel

	afb         init 0

	adel        = adel + (afb * a(kfb))

	; important, or signal bias grows rapidly
	adel        dcblock2 adel
	adel        tanh adel

	a_          = 0
	adel, a_    reverbsc adel, a_, limit(kfb*2, 0, .95), sr / 3

	ifftsize    init 4096 
	ioverlap    init ifftsize / 4 
	iwinsize    init ifftsize 
	iwinshape   init 1 ; von-Hann window 

	fftin       pvsanal adel, ifftsize, ioverlap, iwinsize, iwinshape 
	fftscale    pvscale fftin, kratio, 0, 1
	atrans      pvsynth fftscale

	; delay the feedback to let it build up over time
	afb         vdelay3 atrans, a(ktime*1000), imaxdel
	aout         =  ain*(1-kwet) + adel*(1-kfb/4)

		xout aout

endop

instr 14

	idur	abs p3
	idyn	init p4
	icps	abs p5

	itie	tival
	iport	init idur/32

	iatk	init .05
	idec	init .05
	isus	init idyn/2
	irel	init idur - (iatk + idec)
	iphase init -1

	; if tied note
	tigoto SKIP_INIT
		iphase init 0
		icps_last init icps
		isus_last init isus

	SKIP_INIT:

	if (itie == 0 && p3 < 0 && p5 > 0) then
		prints "TIED: INITIAL NOTE\n"
		aenv	cosseg 0, iatk, idyn, idec, isus
		kcps	init icps

	elseif (p3 < 0 && itie == 1 && p5 > 0) then
		prints "TIED: MIDDLE NOTE\n"
		aenv	cosseg isus_last, idur/2, idyn, idur/2, isus
		kcps	cosseg icps_last, idur, icps
		icps_last init icps
		isus_last init isus

	elseif (p3 > 0 && itie == 1 && p5 > 0) then
		prints "TIED: END NOTE\n"
		aenv	cosseg isus_last, idur/2, idyn, idur/2, 0
		kcps	cosseg icps_last, idur, icps

	elseif (p3 > 0 && itie == 0 && p5 > 0) then
		prints "STANDALONE NOTE\n"
		aenv	cosseg 0, iatk, idyn, idec, isus, irel, 0
		kcps	= icps

	elseif (p3 < 0 && itie == 0 && p5 < 0) then
		prints "SLURRED: INITIAL NOTE\n"
		aenv	cosseg 0, iatk, idyn, idec, isus
		kcps	init icps

	elseif (p3 < 0 && itie == 1 && p5 < 0) then
		prints "SLURRED: MIDDLE NOTE\n"
		aenv	cosseg isus_last, idur/2, idyn, idur/2, isus
		kcps	cosseg icps_last, iport, icps
		icps_last init icps
		isus_last init isus

	elseif (p3 > 0 && itie == 1 && p5 < 0) then
		prints "SLURRED: END NOTE\n"
		aenv	cosseg isus_last, idur/2, idyn, idur/2, 0
		kcps	cosseg icps_last, iport, icps

	endif

	;aout	vco2 1, kcps, itie
	aout	oscili 1/3, kcps, gitri, iphase
	;aout	moogladder2 aout, limit(kcps+kcps*4+icps*24*aenv, kcps, 15000), .5+jitter:k(.35, 1/idur, 3/idur), itie

	aout = aout * aenv

	outall aout

endin



instr rev
	ain1 chnget "mod_ch1"
	ain2 chnget "mod_ch1"

	ktempo tempoval
	ktime = ktempo/60

	#define fb #.5+jitter(.05, ktime/32, ktime/8)#

	kvals[]	fillarray 2, 4, 1, .5, 5, 9, 7
	ilen lenarray kvals
	kratio = kvals[samphold:k(abs(jitter:k(ilen, ktime/8, 3)), metro:k(ktime))]

	#define wet #abs(jitter:k(.5, ktime/16, ktime/4)*cosseg(0, 3, 1))#
	aout1 cordelia_shimmer_reverb ain1*giDYN, ktime, $fb, kratio, $wet 
	aout2 cordelia_shimmer_reverb ain2*giDYN, ktime, $fb, kratio, $wet 

		outs aout1, aout2
endin
alwayson("rev")

instr del
	ain1 chnget "mod_ch1"
	ain2 chnget "mod_ch1"

	ktempo tempoval
	ktime = ktempo/60

	#define fb #.75+jitter(.225, ktime/32, ktime)#

	;kvals[]	fillarray 2, 1, .5, .25, .125
	kvals[]	fillarray .25, .5, 1, 2, 3, 4, 5, 6, 7, 9, 12
	ilen lenarray kvals
	kratio = kvals[samphold:k(abs(jitter:k(ilen, ktime/8, 3)), metro:k(ktime))]

	#define wet #abs(jitter:k(1, ktime/16, ktime/4)*cosseg(0, 3, 1))#
	aout1 flanger ain1/24, a(ktime/kratio), $fb
	aout2 flanger ain2/24, a(ktime/kratio), $fb 

		outs aout1*$wet, aout2*$wet
endin
;alwayson("del")


instr del_min
	ain1 chnget "mod_ch1"
	ain2 chnget "mod_ch1"

	ktempo tempoval
	ktime = ktempo/60/12

	#define fb #.75+jitter(.225, ktime/32, ktime)#

	;kvals[]	fillarray 2, 1, .5, .25, .125
	kvals[]	fillarray .25, .5, 1, 2, 3, 4, 5, 6, 7, 9, 12
	ilen lenarray kvals
	kratio = kvals[samphold:k(abs(jitter:k(ilen, ktime/24, ktime/12)), metro:k(ktime/4))]

	#define wet #abs(jitter:k(1, ktime/16, ktime/4)*cosseg(0, 3, 1))#
	aout1 flanger ain1/12, a(ktime/kratio), $fb
	aout2 flanger ain2/12, a(ktime/kratio), $fb 

	outs aout1*$wet, aout2*$wet
endin
;alwayson("del_min")

instr 995
	chnclear "mod_ch1"
	chnclear "mod_ch2"
endin
alwayson(995)

