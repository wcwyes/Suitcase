local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end




local function create_locked ( name, infotext )
    local def = { }
    for k, v in pairs(minetest.registered_nodes[name]) do
        def[k] = v
    end
    def.type = nil
    def.name = nil
    def.description = S("%s (Locked)"):format(def.description)
    local after_place_node = def.after_place_node
    def.after_place_node = function(pos, placer)
        local meta = minetest.env:get_meta(pos)
        meta:set_string("owner", placer:get_player_name() or "")
        meta:set_string("infotext", S("%s (owned by %s)"):format(infotext,meta:get_string("owner")))
        if (after_place_node) then
            return after_place_node(pos, placer)
        end
    end
    local allow_metadata_inventory_move = def.allow_metadata_inventory_move;
	def.allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.env:get_meta(pos)
        if (player:get_player_name() ~= meta:get_string("owner")) then
            minetest.log("action", S("%s tried to access a %s belonging to %s at %s"):format(
                player:get_player_name(),
                infotext,
                meta:get_string("owner"),
                minetest.pos_to_string(pos)
            ))
			return 0
		end
		if (allow_metadata_inventory_move) then
		    return allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
		else
		    return count
        end
	end
	local allow_metadata_inventory_put = def.allow_metadata_inventory_put;
    def.allow_metadata_inventory_put = function(pos, listname, index, stack, player)
        local meta = minetest.env:get_meta(pos)
        if (player:get_player_name() ~= meta:get_string("owner")) then
            minetest.log("action", S("%s tried to access a %s belonging to %s at %s"):format(
                player:get_player_name(),
                infotext,
                meta:get_string("owner"),
                minetest.pos_to_string(pos)
            ))
            return 0
        end
        if (allow_metadata_inventory_put) then
            return allow_metadata_inventory_put(pos, listname, index, stack, player)
        else
            return stack:get_count()
        end
    end
    local allow_metadata_inventory_take = def.allow_metadata_inventory_take;
    def.allow_metadata_inventory_take = function(pos, listname, index, stack, player)
        local meta = minetest.env:get_meta(pos)
        if (player:get_player_name() ~= meta:get_string("owner")) then
            minetest.log("action", S("%s tried to access a %s belonging to %s at %s"):format(
                player:get_player_name(),
                infotext,
                meta:get_string("owner"),
                minetest.pos_to_string(pos)
            ))
            return 0
        end
        if (allow_metadata_inventory_take) then
            return allow_metadata_inventory_take(pos, listname, index, stack, player)
        else
            return stack:get_count()
        end
    end
    minetest.register_node(name.."_locked", def)
    minetest.register_craft({
        output = name.."_locked",
        type = "shapeless",
        recipe = {
            name,
            "default:steel_ingot", "default:steel_ingot",
        }
    })
end

local items = {
    { "suitcase",
      "suitcase" },
}

for _,item in ipairs(items) do
    local name, info = item[1];
    create_locked("suicase:"..name, S("Locked "..info));
end
