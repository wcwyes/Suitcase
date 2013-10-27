local DEBUG = 0

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

-- Various Functions

local dbg = function(s)
	if DEBUG == 1 then
		print('[Suitcase] ' .. s)
	end
end

function suitcase_node_is_owned(pos, placer)
	local ownername = false
	if type(IsPlayerNodeOwner) == "function" then					-- node_ownership mod
		if HasOwner(pos, placer) then						-- returns true if the node is owned
			if not IsPlayerNodeOwner(pos, placer:get_player_name()) then
				if type(getLastOwner) == "function" then		-- ...is an old version
					ownername = getLastOwner(pos)
				elseif type(GetNodeOwnerName) == "function" then	-- ...is a recent version
					ownername = GetNodeOwnerName(pos)
				else
					ownername = S("someone")
				end
			end
		end

	elseif type(isprotect)=="function" then 					-- glomie's protection mod
		if not isprotect(5, pos, placer) then
			ownername = S("someone")
		end
	end

	if ownername ~= false then
		minetest.chat_send_player( placer:get_player_name(), S("Sorry, %s owns that spot."):format(ownername) )
		return true
	else
		return false
	end
end	

dofile(minetest.get_modpath("suitcase").."/suitcase.lua")

dofile(minetest.get_modpath("suitcase").."/crafts.lua")

dofile(minetest.get_modpath("suitcase").."/briefcase.lua")

print("[Suitcase] "..S("Loaded!"))
