/obj/item/solarlens_broken
	name = "damaged solar lens"
	desc = "A curious lenslike alien device of an unknown but seemingly-indestructible substance. A large scorched crack defaces one side of it, yet it still glows, a remnant of thermonuclear fury that once rivaled suns."
	icon = 'modular_R505/icons/obj/oddities.dmi'
	icon_state = "solarlens_cracked"
	w_class = WEIGHT_CLASS_SMALL
	var/cooldown = 5 MINUTES
	var/on_cooldown = FALSE
	var/mob/living/owner

/obj/item/solarlens_broken/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/item/solarlens_broken/Destroy()
	STOP_PROCESSING(SSobj,src)
	return ..()

/obj/item/solarlens_broken/examine(mob/user)
	. = ..()
	if(on_cooldown)
		. += "\nIts fire has waned slightly, but is gradually recharging."

/obj/item/solarlens_broken/proc/do_cooldown(time)
	if(on_cooldown)
		return
	on_cooldown = TRUE
	spawn(time)
	on_cooldown = FALSE

/obj/item/solarlens_broken/process()
	var/robob = null
	if(issynthetic(loc))
		robob = loc
	if(issynthetic(loc.loc)) //Check if in bag or somesuch.
		robob = (loc.loc)
	if(!robob)
		return
	var/mob/living/carbon/human/H = robob
	var/effect = /datum/status_effect/broken_lens_revive
	if(!H.has_status_effect(effect))
		var/datum/status_effect/broken_lens_revive/R = H.apply_status_effect(effect)
		owner = H
		R.lens = src
		STOP_PROCESSING(SSobj,src)

//Hacky status effect fix
/datum/status_effect/broken_lens_revive
	id = "brokenlensrevive"
	duration = -1
	alert_type = null
	var/obj/item/solarlens_broken/lens

/datum/status_effect/broken_lens_revive/tick()
	if(!lens || !lens.loc) //Sanity checking
		qdel(src)
		return
	if(lens && lens.loc != owner && lens.loc.loc != owner)
		if(!QDELETED(lens))
			lens.owner = null
			START_PROCESSING(SSobj,lens)
		qdel(src)
	if(owner.health < 0 && owner.stat != DEAD && !lens.on_cooldown)
		while(owner.health < 10)
			owner.heal_overall_damage(brute = 1, burn = 1)
		if(owner.get_damage_amount(STAMINA) > 0)
			owner.adjustStaminaLoss(-owner.get_damage_amount(STAMINA))
			owner.set_body_position(STANDING_UP)
		owner.visible_message(SPAN_WARNING("[owner] suddenly drags themself back to their feet in spite of their broken frame! You swear for a second it almost looked like they were on fire..."), SPAN_WARNING("As your sensors go dark, you feel... something, propagating through your shell from [lens], rebuilding damaged systems, giving you the strength to drag yourself upright and go on, one last time."))
		lens.do_cooldown(lens.cooldown)
	return ..()