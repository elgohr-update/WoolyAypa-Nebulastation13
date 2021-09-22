/datum/crafting_recipe/bigknife
    name = "Big Knife" // Pesquise "nordestino facão enorme" no google imagens para ter a referência.
    result = /obj/item/kitchen/bigknife
    reqs = list(/obj/item/kitchen/knife = 5)
    time = 60
    category = CAT_WEAPONRY
    subcategory = CAT_WEAPON

/obj/item/kitchen/bigknife
    name = "Big Knife"
    desc = "A Biiig Knife, probably not for the weak-armed!"
    icon = 'nebula_modular/icons/obj/weapons/big_knife.dmi'
    icon_state = "big_knife"
    lefthand_file = 'nebula_modular/icons/obj/weapons/32x32_lefthand.dmi'
    righthand_file = 'nebula_modular/icons/obj/weapons/32x32_righthand.dmi'
    w_class = WEIGHT_CLASS_HUGE
    hitsound = 'sound/weapons/bladeslice.ogg'
    flags_1 = CONDUCT_1
    slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
    force = 25
    throwforce = 15
    attack_verb_continuous = list("butchers", "slices")
    attack_verb_simple = list("butchers", "slices")
    sharpness = SHARP_EDGED
    block_chance = 75
    max_integrity = 100
    armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 50, ACID = 0)
    resistance_flags = FIRE_PROOF

/obj/item/kitchen/bigknife/attack(mob/living/bicho, mob/living/pessoinha)
    . = ..()
    if(!bicho.butcher_results)
        to_chat(pessoinha, span_warning("You can't get this being's meat!"))
        return
    for(var/content in bicho.butcher_results)
        new content(get_turf(bicho))
        bicho.butcher_results.Remove(content)