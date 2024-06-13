
cd "$(dirname "$0")"

csound --nchnls=2 --0dbfs=1 --sample-rate=48000 --ksmps=16 --env:INCDIR=/Users/j/Documents/PROJECTs/CORDELIA/cordelia -3 --limiter -+id_artist="jacopo greco d'alceo" -odac -Ma _play.csd