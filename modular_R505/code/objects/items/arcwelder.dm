/obj/item/weldingtool/electric //Shamelessly stolen from Skyrat - R505
	name = "arc welder"
	desc = "A sophisticated electroplasma arc welder, powered by a battery."
	icon = 'modular_R505/icons/obj/tools.dmi'
	icon_state = "arcwelder"
	inhand_icon_state = "arcwelder"
	light_power = 1
	light_color = LIGHT_COLOR_HALOGEN
	tool_behaviour = NONE
	toolspeed = 0.2
	var/obj/item/stock_parts/cell/cell
	var/preload_cell_type = /obj/item/stock_parts/cell/high //Welder starts with this type of cell
	var/cell_use_cost = 1000
	var/can_remove_cell = TRUE
	change_icons = TRUE
	var/powered = FALSE
	max_fuel = 20

/obj/item/weldingtool/electric/proc/deductcharge(chrgdeductamt) //Controls power usage
	if(cell)
		. = cell.use(chrgdeductamt)
		if(powered && cell.charge < cell_use_cost) //On and current cell charge is less than minimum use requirement
			//we're below minimum, turn off
			powered = FALSE
			update_appearance()
			playsound(src, 'modular_R505/sound/tools/ewelderOff.ogg', 75, TRUE, -1)

/obj/item/weldingtool/electric/update_overlays()
	. = ..()
	if(change_icons)
		var/ratio = cell.percent()
		ratio = CEILING(ratio*3, 1) * 33
		. += "[initial(icon_state)][ratio]"
	if(welding)
		. += "[initial(icon_state)]-on"

/obj/item/weldingtool/electric/attack_self(mob/user, modifiers)
	. = ..()
	if(!powered)
		if(!(item_use_power(power_use_amount, user, TRUE) & COMPONENT_POWER_SUCCESS))
			return
	powered = !powered
	if(powered)
		to_chat(user, "<span class='notice'>You turn [src] on.</span>")
		//R505 EDIT - new noises for this thang
		playsound(src, 'modular_R505/sound/tools/ewelderOn.ogg', 70, FALSE)
		switched_on()
		return
	to_chat(user, "<span class='notice'>You turn [src] off.</span>")
	//R505 EDIT - new noises for this thang
	playsound(src, 'modular_R505/sound/tools/ewelderOff.ogg', 70, FALSE)
	switched_off()

/obj/item/weldingtool/electric/switched_on(mob/user)
	welding = TRUE
	tool_behaviour = TOOL_WELDER
	light_on = TRUE
	force = 15
	damtype = BURN
	hitsound = 'sound/items/welder.ogg'
	set_light_on(powered)
	update_appearance()
	START_PROCESSING(SSobj, src)

/obj/item/weldingtool/electric/switched_off(mob/user)
	powered = FALSE
	light_on = FALSE
	force = initial(force)
	damtype = BRUTE
	set_light_on(powered)
	tool_behaviour = NONE
	update_appearance()
	STOP_PROCESSING(SSobj, src)

/obj/item/weldingtool/electric/process(delta_time)
	if(!powered)
		switched_off()
		return
	if(!(item_use_power(power_use_amount) & COMPONENT_POWER_SUCCESS))
		switched_off()
		return

// We don't need to know how much fuel it has, because it doesn't use any.
/obj/item/weldingtool/electric/examine(mob/user)
	. = ..()
	. -= "It contains [get_fuel()] unit\s of fuel out of [max_fuel]."

// This is what uses fuel in the parent. We override it here to not use fuel
/obj/item/weldingtool/electric/use(used = 0)
	return isOn()

// This is what starts fires. Overriding it stops it starting fires
/obj/item/weldingtool/electric/handle_fuel_and_temps(used = 0, mob/living/user)
	return

/obj/item/weldingtool/electric/examine()
	. = ..()
	. += "[src] is currently [powered ? "powered" : "unpowered"]."

/obj/item/weldingtool/electric/update_icon_state()
	if(powered)
		inhand_icon_state = "[initial(inhand_icon_state)]1"
	else
		inhand_icon_state = "[initial(inhand_icon_state)]"
	return ..()

//R505 edit
/obj/item/weldingtool/electric/update_overlays()
	. = ..()
	if(!powered)
		. -= "[initial(icon_state)]-on"

/datum/design/arcwelder
	name = "Arc Welder"
	desc = "A sophisticated electroplasma arc welder, powered by a battery."
	id = "exwelder"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500, /datum/material/plasma = 1500, /datum/material/uranium = 200)
	build_path = /obj/item/weldingtool/electric
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING
