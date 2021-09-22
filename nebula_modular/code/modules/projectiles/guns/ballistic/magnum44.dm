#define CALIBER_SW44 ".44M"

/obj/projectile/bullet/m44
	name = ".44 bullet"
	damage = 30
	sharpness = SHARP_EDGED

/obj/item/ammo_casing/m44
	name = ".44 bullet casing"
	desc = "A .44 bullet casing."
	caliber = CALIBER_SW44
	projectile_type = /obj/projectile/bullet/m44
	icon = 'nebula_modular/icons/obj/guns/magnum44.dmi'
	icon_state = "1-live"

/obj/item/gun/ballistic/revolver/sw23
	name = "S&W Model 23"
	desc = "Feeling lucky, punk?"
	icon = 'nebula_modular/icons/obj/guns/magnum44.dmi'
	icon_state = "revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/sw23

/obj/item/ammo_box/magazine/internal/cylinder/sw23
	name = "S&W's cylinder"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = CALIBER_SW44
	max_ammo = 6

#undef CALIBER_SW44