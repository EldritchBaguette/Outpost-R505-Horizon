//Subtype of human
/datum/species/human/felinid
	name = "Felinid"
	id = "felinid"
	say_mod = "meows"
	limbs_id = "human"

	default_mutant_bodyparts = list(
		"tail" = "Cat",
		"ears" = "Cat",
	)

	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/felinid
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_FREERUNNING,
		TRAIT_SKITTISH,
		TRAIT_LIGHT_STEP	
	)

	mutanteyes = /obj/item/organ/eyes/night_vision/feline


	disliked_food = GROSS | RAW | CLOTH
	ass_image = 'icons/ass/asscat.png'
	family_heirlooms = list(/obj/item/toy/cattoy)
