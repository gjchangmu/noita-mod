dofile_once("mods/portal_key/config.lua")

table.insert(g_items, 	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/portal_key/files/data/entities/portal_key_item.xml",
		spawn_check = function() 
			local keyg = GlobalsGetValue("cryptkeygenerated", "0")
			if keyg == "0" then
				GlobalsSetValue("cryptkeygenerated", 1)
				if Portal_Key_Debug == 1 then GamePrint("One Key Generated (Temple of the Art, g_item)")	end
				return true
			else
				--if Portal_Key_Debug == 1 then GamePrint("Denied (Temple of the Art)") end
				return false
			end
		end,
	})
	
table.insert(g_small_enemies, {
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "mods/portal_key/files/data/entities/portal_key_item.xml",
		spawn_check = function() 
			local keyg = GlobalsGetValue("cryptkeygenerated", "0")
			if keyg == "0" then
				GlobalsSetValue("cryptkeygenerated", 1)
				if Portal_Key_Debug == 1 then GamePrint("One Key Generated (Temple of the Art, g_small_enemies)") end
				return true
			else
				--if Portal_Key_Debug == 1 then GamePrint("Denied (Temple of the Art)") end
				return false
			end
		end,
	})