/datum/species/xeno
	name = "Xenomorph Hybrid"
	id = "xeno"
	flavor_text = "Human/xenomorph hybrids born of a long-lost Nanotrasen bioweapon project. Smarter, friendlier, and less parasitic than \'pure\' xenos."
	say_mod = "hisses"
	default_color = "0F0"
	species_traits = list(MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAS_FLESH,
		HAS_BONE,
		NOEYESPRITES
	) //R505 edit - why did the benos have eyes?
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID

	//R505 Edit - Begin (Haddish doesn't understand balance) :>
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_NOBREATH,
		TRAIT_OXYIMMUNE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTCOLD,
		TRAIT_XENO_IMMUNE,
		TRAIT_NOFLASH,
		TRAIT_PASSTABLE
	)
	//R505 Edit - End

	mutant_bodyparts = list()
	default_mutant_bodyparts = list(
		"tail" = "Xenomorph Tail",
		"legs" = "Digitigrade Legs",
		"xenodorsal" = ACC_RANDOM,
		"xenohead" = ACC_RANDOM,
		"taur" = ACC_NONE
	)
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	liked_food = MEAT
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	burnmod = 1.1
	heatmod = 1.2
	brutemod = 0.75

	//mutant_organs = list(/obj/item/organ/)
	mutantbrain = /obj/item/organ/brain/alien
	mutanttongue = /obj/item/organ/tongue/alien
	mutanteyes = /obj/item/organ/eyes/night_vision/alien
	//mutantlungs = /obj/item/organ/lungs/
	//mutantheart = /obj/item/organ/heart/
	//mutantliver = /obj/item/organ/liver/
	//exotic_blood = /datum/reagent/

	limbs_icon = 'icons/mob/species/xeno_parts_greyscale.dmi'
	damage_overlay_type = "xeno"
	scream_sounds = list(
		NEUTER = 'sound/voice/hiss6.ogg',
	)

/datum/species/xeno/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = ..()
	passtable_on(C, ROUNDSTART_TRAIT)

/datum/species/xeno/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	passtable_off(C, ROUNDSTART_TRAIT)
