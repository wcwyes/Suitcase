local S
if (minetest.get_modpath("intllib")) then
    dofile(minetest.get_modpath("intllib").."/intllib.lua")
    S = intllib.Getter(minetest.get_current_modname())
else
    S = function ( s ) return s end
end

minetest.register_craft({
        output = "suitcase:suitcase",
        recipe = {
		{"default:mese_block", "default:wood", "default:mese_block", },
		{"unified_inventory:bag_large", "unified_inventory:bag_large", "unified_inventory:bag_large", },
		{"unified_inventory:bag_large", "unified_inventory:bag_large", "unified_inventory:bag_large", },
	}
})
minetest.register_craft({
output = "suitcase:briefcase",
recipe = {
{"homedecor:brass_ingot", "default:mese_crystal_fragment", "homedecor:brass_ingot"},
{"default:obsidian_shard", "dye:black", "default:obsidian_shard"},
{"unified_inventory:bag_large", "default:wood", "unified_inventory:bag_large"}
}
})
