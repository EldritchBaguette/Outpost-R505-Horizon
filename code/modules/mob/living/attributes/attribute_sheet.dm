/// Attribute sheets are datums which allow to easily add or remove amounts of attributes and skill
/datum/attribute_sheet
	/// Name of the attribute sheet. Important for an admin tool.
	var/name = "Sheet name"
	/// Nullable assoc list of attribute types to values to add (can be negatives)
	var/list/attributes
	/// Nullable assoc list of skill types to values to add (can be negatives)
	var/list/skills

/datum/attribute_sheet/engineer
	name = "Engineer"
	skills = list(
		/datum/skillHRZNTL/electrical = 4, //R505 Edit - Tempfix "skill" >"skillHRZNTL"
		/datum/skillHRZNTL/mechanical = 4, //R505 Edit - Tempfix "skill" >"skillHRZNTL"
		/datum/skillHRZNTL/eva = 2, //R505 Edit - Tempfix "skill" >"skillHRZNTL"
		)

/datum/attribute_sheet/doctor
	name = "Doctor"
	skills = list(
		/datum/skillHRZNTL/first_aid = 5, //R505 Edit - Tempfix "skill" >"skillHRZNTL"
		/datum/skillHRZNTL/surgery = 5 //R505 Edit - Tempfix "skill" >"skillHRZNTL"
		)
