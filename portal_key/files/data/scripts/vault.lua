dofile_once("mods/portal_key/config.lua")

local keyitemstr = ""
if Key_Emit_Light then
	keyitemstr = "mods/portal_key/files/data/entities/portal_key_item.xml"
else
	keyitemstr = "mods/portal_key/files/data/entities/portal_key_item_nolight.xml"
end

local gsep = gsep_multiplier * Key_Generated_Per_Boime_About
if gsep < gsep_min then gsep = gsep_min end
if gsep > gsep_max then gsep = gsep_max end
gsep = gsep * 2
table.insert(g_small_enemies, {
		prob   		= gsep,
		min_count	= 1,
		max_count	= 1,    
		entity 	= keyitemstr,
		spawn_check = function() 
			local keyg = tonumber(GlobalsGetValue("keygenerated6", "-1"))
			if keyg < Key_Generated_Per_Boime_About then
				GlobalsSetValue("keygenerated6", keyg + 1)
				if Portal_Key_Debug == 1 then GamePrint(keyg+1 .. " Keys Generated (Vault)") end
				return true
			else
				--if Portal_Key_Debug == 1 then GamePrint("Denied (Vault)") end
				return false
			end
		end,
	})