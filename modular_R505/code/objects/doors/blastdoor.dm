// /obj/machinery/door/poddoor
//  	var/door_sound = 'sound/machines/blastdoor.ogg'
/obj/machinery/door/poddoor/shutters
	var/door_open_sound = 'modular_R505/sound/doors/shutter.ogg'
	var/door_close_sound = 'modular_R505/sound/doors/shutter.ogg'

/obj/machinery/door/poddoor/shutters/do_animate(animation)
	switch(animation)
		if("opening")
			flick("opening", src)
			playsound(src, door_open_sound, 30, FALSE)
		if("closing")
			flick("closing", src)
			playsound(src, door_close_sound, 30, FALSE)
