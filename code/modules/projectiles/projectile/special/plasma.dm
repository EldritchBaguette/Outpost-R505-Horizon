/obj/projectile/plasma
	name = "plasma beam"
	icon_state = "plasmacutter"
	damage_type = BURN
	damage = 10
	range = 3
	dismemberment = 20

	hitscan = TRUE
	muzzle_type = /obj/effect/projectile/muzzle/plasma_cutter
	tracer_type = /obj/effect/projectile/tracer/plasma_cutter
	impact_type = /obj/effect/projectile/impact/plasma_cutter
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = COLOR_BRIGHT_BLUE
	muzzle_flash_intensity = 6
	muzzle_flash_range = 2
	muzzle_flash_color_override = COLOR_BRIGHT_BLUE
	impact_light_intensity = 7
	impact_light_range = 2.5
	impact_light_color_override = COLOR_BRIGHT_BLUE

/obj/projectile/plasma/on_hit(atom/target)
	. = ..()
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer, FALSE)
		if(range > 0)
			return BULLET_ACT_FORCE_PIERCE

/obj/projectile/plasma/adv
	damage = 15
	range = 4

/obj/projectile/plasma/adv/mech
	damage = 30
	range = 6

/obj/projectile/plasma/turret
	//Between normal and advanced for damage, made a beam so not the turret does not destroy glass
	name = "plasma beam"
	damage = 24
	range = 7
