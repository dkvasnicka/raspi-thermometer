raspi-thermometer
=================
This is a temperature measurement & charting micro-PoC that I built to verify that Racket and Riak are actually usable on Raspberry Pi.
I presented this as a lightning talk on [Lambda](http://srazy.info/lambda-meetup-ostrava/terminy/) [Meetup](https://plus.google.com/communities/110902954360410928675) in Ostrava, CZ.

It's built using my [Racket Riak library](https://github.com/dkvasnicka/racket-riak). Setup a Riak instance on your Pi, run the temp recorder and then run the monitor app (wherever you want) and point it to the Riak node on your Pi.

Big thanks to the author of [Reading Analogue Sensors With One GPIO Pin](http://www.raspberrypi-spy.co.uk/2012/08/reading-analogue-sensors-with-one-gpio-pin/) for reviving my high school memories :) The circuit I built on my RPi is virtually the same as the one described in the article (with a thermistor instead of LDR of course).

