/obj/item/clothing/head/helmet/space/hardsuit/seeker
	name = "Seeker helmet"
	desc = "Capacete pica de uma armadura pica!"
	icon = 'nebula_modular/code/modules/clothing/seeker_armor/Seeker_Mk1.dmi'
	icon_state = "SeekerMk1-h"
	worn_icon = 'nebula_modular/code/modules/clothing/seeker_armor/Seeker_Mk1.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 5, BIO = 5, RAD = 5, FIRE = 5, ACID = 5, WOUND = 5)
	heat_protection = HEAD
	cold_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT
	actions_types = null

/obj/item/clothing/suit/space/hardsuit/seeker
	name = "Seeker suit"
	desc = "Armadura pica das galaxias para seguranças B)"
	icon = 'nebula_modular/code/modules/clothing/seeker_armor/Seeker_Mk1.dmi'
	icon_state = "SeekerMk1M-h"
	worn_icon = 'nebula_modular/code/modules/clothing/seeker_armor/Seeker_Mk1.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/seeker
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 5, BIO = 5, RAD = 5, FIRE = 5, ACID = 5, WOUND = 5)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cell = /obj/item/stock_parts/cell/upgraded/plus
	allowed = list(
					/obj/item/restraints,
					/obj/item/flashlight,
					/obj/item/tank/internals,
					/obj/item/gun,
					/obj/item/melee/baton
				)
	flags_inv = HIDEJUMPSUIT
	resistance_flags = FIRE_PROOF | ACID_PROOF

///Alteração de gênero da roupa ao ser equipada
/obj/item/clothing/suit/space/hardsuit/seeker/equipped(mob/living/carbon/human/user)
	..()
	switch(user.gender)
		if("male")
			icon_state = "SeekerMk1M-h"
			worn_icon_state = "SeekerMk1M"
		if("female")
			icon_state = "SeekerMk1F-h"
			worn_icon_state = "SeekerMk1F"
		else
			icon_state = "SeekerMk1M-h"
			worn_icon_state = "SeekerMk1M"

/obj/item/clothing/suit/space/hardsuit/seeker/attackby(obj/item/I, mob/user)
	var/list/seeker_variations = list(
			/obj/item/stack/sheet/iron = /obj/item/clothing/suit/space/hardsuit/seeker/seekeriron,
			/obj/item/stack/sheet/glass = /obj/item/clothing/suit/space/hardsuit/seeker/seekerglass,
			/obj/item/stack/sheet/mineral/gold = /obj/item/clothing/suit/space/hardsuit/seeker/seekergold
		)

	if(istype(I, /obj/item/stack/sheet))
		var/suit_path = seeker_variations[I]
		to_chat(user, span_notice("[suit_path] You insert [I] into the suit as it quickly absorbs the ore"))
		if(!suit_path)
			suit_path = /obj/item/clothing/suit/space/hardsuit/seeker
		new suit_path(get_turf(src))
		qdel(src)
		qdel(I)
	return
