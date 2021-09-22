/obj/item/clothing/head/helmet/space/hardsuit/seeker/seekerglass
	icon_state = "SeekerMk1-h"
	armor = list(MELEE = 10, BULLET = 10, LASER = 100,ENERGY = 30, BOMB =-300, BIO = 50, RAD = 50, FIRE = 50, ACID = 10, WOUND = 5)
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/space/hardsuit/seeker/seekerglass
	icon_state = "SeekerMk1M-h"
	worn_icon = 'nebula_modular/code/modules/clothing/seeker_armor/Seeker_Mk1.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/seeker/seekerglass
	armor = list(MELEE = -50, BULLET = -50, LASER = 300,ENERGY = 30, BOMB =-300, BIO = 50, RAD = 50, FIRE = 50, ACID = 10, WOUND = 5)
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

/obj/item/clothing/suit/space/hardsuit/seeker/seekerglass/equipped(mob/living/carbon/human/user)
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

/obj/item/clothing/suit/space/hardsuit/seeker/seekerglass/hit_reaction(mob/living/carbon/human/user, obj/projectile/damager)
	..()
	if(istype(damager, /obj/projectile/beam))
		damager.set_angle(360)
		return BULLET_ACT_FORCE_PIERCE
	return BULLET_ACT_HIT