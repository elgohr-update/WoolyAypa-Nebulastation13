/datum/supply_pack/security/m16ammo
	name = "M16 Ammo Crate"
	desc = "3 magazina para sua linda e preciosa m16."
	cost = CARGO_CRATE_VALUE * 8
	access_view = ACCESS_CAPTAIN
	contains = list(/obj/item/ammo_box/magazine/m16,
					/obj/item/ammo_box/magazine/m16,
					/obj/item/ammo_box/magazine/m16)
	crate_name = "m16 ammo crate"

/datum/supply_pack/security/m16
	name = "M16 crate"
	desc = "Sua arma preferida e pronta para fuzilar qualquer um em sua frente."
	cost = CARGO_CRATE_VALUE * 25
	access_view = ACCESS_CAPTAIN
	contains = list(/obj/item/gun/ballistic/automatic/assault_rifle/m16)
	crate_name = "m16 gun crate"