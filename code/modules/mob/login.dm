/**
 * Run when a client is put in this mob or reconnets to byond and their client was on this mob
 *
 * Things it does:
 * * Adds player to player_list
 * * sets lastKnownIP
 * * sets computer_id
 * * logs the login
 * * tells the world to update it's status (for player count)
 * * create mob huds for the mob if needed
 * * reset next_move to 1
 * * parent call
 * * if the client exists set the perspective to the mob loc
 * * call on_log on the loc (sigh)
 * * reload the huds for the mob
 * * reload all full screen huds attached to this mob
 * * load any global alternate apperances
 * * sync the mind datum via sync_mind()
 * * call any client login callbacks that exist
 * * grant any actions the mob has to the client
 * * calls [auto_deadmin_on_login](mob.html#proc/auto_deadmin_on_login)
 * * send signal COMSIG_MOB_CLIENT_LOGIN
 * * attaches the ash listener element so clients can hear weather
 * client can be deleted mid-execution of this proc, chiefly on parent calls, with lag
 */
/mob/Login()
	if(!client)
		return FALSE
	add_to_player_list()
	lastKnownIP = client.address
	computer_id = client.computer_id
	log_access("Mob Login: [key_name(src)] was assigned to a [type]")
	world.update_status()
	client.screen = list() //remove hud items just in case
	client.images = list()
	client.set_right_click_menu_mode(shift_to_open_context_menu)

	if(!hud_used)
		create_mob_hud()
	if(hud_used)
		hud_used.show_hud(hud_used.hud_version)
		hud_used.update_ui_style(ui_style2icon(client.prefs.UI_style))

	next_move = 1

	..()

	if(!client)
		return FALSE

	//We do this here to prevent hanging refs from ghostize or whatever, since if we were in another mob before this'll take care of it
	clear_client_in_contents()

	SEND_SIGNAL(src, COMSIG_MOB_LOGIN)

	if (key != client.key)
		key = client.key
	reset_perspective(loc)

	if(loc)
		loc.on_log(TRUE)

	//readd this mob's HUDs (antag, med, etc)
	reload_huds()

	reload_fullscreen() // Reload any fullscreen overlays this mob has.

	add_click_catcher()

	sync_mind()

	//Reload alternate appearances
	for(var/v in GLOB.active_alternate_appearances)
		if(!v)
			continue
		var/datum/atom_hud/alternate_appearance/AA = v
		AA.onNewMob(src)

	update_client_colour()
	update_mouse_pointer()
	if(client)
		if(client.view_size)
			client.view_size.resetToDefault() // Resets the client.view in case it was changed.
		else
			client.change_view(getScreenSize(client.prefs.widescreenpref))

		if(client.player_details.player_actions.len)
			for(var/datum/action/A in client.player_details.player_actions)
				A.Grant(src)

		for(var/foo in client.player_details.post_login_callbacks)
			var/datum/callback/CB = foo
			CB.Invoke()
		log_played_names(client.ckey,name,real_name)
		auto_deadmin_on_login()

	log_message("Client [key_name(src)] has taken ownership of mob [src]([src.type])", LOG_OWNERSHIP)
	log_mob_tag("\[[tag]\] NEW OWNER: [key_name(src)]")
	SEND_SIGNAL(src, COMSIG_MOB_CLIENT_LOGIN, client)
	client.init_verbs()

	//AddElement(/datum/element/weather_listener, /datum/weather/ash_storm, ZTRAIT_ASHSTORM, GLOB.ash_storm_sounds) SKYRAT EDIT REMOVAL

	return TRUE


/**
 * Checks if the attached client is an admin and may deadmin them
 *
 * Configs:
 * * flag/auto_deadmin_players
 * * client.prefs?.toggles & DEADMIN_ALWAYS
 * * User is antag and flag/auto_deadmin_antagonists or client.prefs?.toggles & DEADMIN_ANTAGONIST
 * * or if their job demands a deadminning SSjob.handle_auto_deadmin_roles()
 *
 * Called from [login](mob.html#proc/Login)
 */
/mob/proc/auto_deadmin_on_login() //return true if they're not an admin at the end.
	if(!client?.holder)
		return TRUE
	if(CONFIG_GET(flag/auto_deadmin_players) || (client.prefs?.toggles & DEADMIN_ALWAYS))
		return client.holder.auto_deadmin()
	if(mind.has_antag_datum(/datum/antagonist) && (CONFIG_GET(flag/auto_deadmin_antagonists) || client.prefs?.toggles & DEADMIN_ANTAGONIST))
		return client.holder.auto_deadmin()
	if(job)
		return SSjob.handle_auto_deadmin_roles(client, job)
