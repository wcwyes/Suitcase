local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

minetest.register_node('suitcase:general_node', {
    drawtype = "nodebox",
    description = S("general suitcase"),
    tiles = {
        'suitcase_top.png',
        'suitcase_bottom.png',
        'suitcase_side.png',
        'suitcase_side.png',
        'suitcase_front.png',	
        'suitcase_front.png'
    },
    inventory_image = "small_suitcase_inv.png",
    sunlight_propagates = false,
    paramtype = "light",
    paramtype2 = "facedir",
    walkable = true,
    groups = { snappy = 3, not_in_creative_inventory = 1}, suitcase,
    drop = 'suitcase:general',

        selection_box = {
                type = "fixed",
                fixed = { -0.1, -0.5, -0.5, 0.1, 0.3, 0.5 }
        },
        node_box = {
                type = "fixed",
                fixed = { -0.1, -0.5, -0.5, 0.1, 0.3, 0.5 }
        },

    sounds = default.node_sound_wood_defaults(),
    on_construct = function(pos)
        local meta = minetest.env:get_meta(pos)
        meta:set_string("formspec",
                "size[10,10]"..
                "list[current_name;main;1,0;8,3;]"..
                "list[current_player;main;1,6;8,4;]")
        meta:set_string("infotext", S("suitcase"))
        local inv = meta:get_inventory()
        inv:set_size("main",24)
    end,

    on_place = function(itemstack, placer, pointed_thing)
        local pos = pointed_thing.above
       
        return minetest.item_place(itemstack, placer, pointed_thing)
    end,

    can_dig = function(pos,player)
        local meta = minetest.env:get_meta(pos);
        local inv = meta:get_inventory()
        return inv:is_empty("main")
    end,
    on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", S("%s moves stuff in suitcase at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
    end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s moves stuff to suitcase at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
    end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s takes stuff from suitcase at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
    end,
})
minetest.register_tool("suitcase:general", {
    description = S("general suitcase"),
    inventory_image = "suitcase_inv.png",
    wield_image = "suitcase_wield.png",
    groups = {bagslots=24}, suitcase,
    on_place = function(itemstack, placer, pointed_thing)
        local pt = pointed_thing
        if minetest.get_node(pt.above).name=="air" then
            local pt = pointed_thing
            minetest.set_node(pt.above, {name="suitcase:general_node", param2=minetest.dir_to_facedir(placer:get_look_dir())})
            itemstack:take_item()
            return itemstack
        end
    end,

})