/datum/skillHRZNTL //R505 Edit - Tempfix "skill" >"skillHRZNTL"
	/// Name of the skill
	var/name = "Skill"
	/// Description of the skill
	var/desc = "Description"
	/// Contribution to the skill value from attributes (counted from base value)
	var/list/affinities

/datum/skillHRZNTL/proc/get_capability_description(value) //R505 Edit - Tempfix "skill" >"skillHRZNTL"
	switch(value)
		if(-INFINITY to -3)
			return "Catastrophic"
		if(-2)
			return "Terrible"
		if(-1)
			return "Bad"
		if(0)
			return "Dabbling"
		if(1)
			return "Novice"
		if(2)
			return "Adequete"
		if(3)
			return "Competent"
		if(4)
			return "Skilled"
		if(5 to INFINITY)
			return "Proficient"

/datum/skillHRZNTL/first_aid //R505 Edit - Tempfix "skill" >"skillHRZNTL"
	name = "First Aid"
	desc = "The ability to effectively perform first aid, applying ointments, sutures, gauze or splints aswell as performing CPR and setting limbs."
	affinities = list(/datum/attribute/intelligence = 0.5)

/datum/skillHRZNTL/surgery //R505 Edit - Tempfix "skill" >"skillHRZNTL"
	name = "Surgery"
	desc = "Precision, hand coordination and the anatomical knowledge required to perform surgery."
	affinities = list(/datum/attribute/intelligence = 0.5)

/datum/skillHRZNTL/electrical //R505 Edit - Tempfix "skill" >"skillHRZNTL"
	name = "Electrical"
	desc = "Knowledge of electrical components and systems, helps with hacking and figuring out which wires do what."
	affinities = list(/datum/attribute/intelligence = 0.5)

/datum/skillHRZNTL/mechanical //R505 Edit - Tempfix "skill" >"skillHRZNTL"
	name = "Mechanical"
	desc = "Proficiency with machinery, tools and it's usage. Increases the speed at which you use tools."
	affinities = list(/datum/attribute/intelligence = 0.5)

/datum/skillHRZNTL/eva //R505 Edit - Tempfix "skill" >"skillHRZNTL"
	name = "Extra-Vehicular Activity"
	desc = "The ability to gracefully perform tasks in no gravity environments and adjusting yourself to changes in gravity or air pressure."
	affinities = list(/datum/attribute/dexterity = 0.5)
