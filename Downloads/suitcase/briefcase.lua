minetest.register_tool("suitcase:briefcase", {
	description = "Briefcase",
	inventory_image = "briefcase_inv.png",
        wield_image = "briefcase_wield.png",
	on_use = function(itemstack, user, pointed_thing) 
        use_handler(itemstack,user,pointed_thing)
        return itemstack
        end,
        on_place = function(itemstack, user, pointed_thing)
        place_handler(itemstack, user, pointed_thing) 
        return itemstack
        end,
})

for i=1,4,1 do
minetest.register_tool("suitcase:briefcase"..i, {
	description = "Briefcase targeting slot "..i,
	inventory_image = "briefcase_inv.png^tool_mode"..i..".png",
	wield_image = "briefcase_wield.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user, pointed_thing)
	use_handler(itemstack,user,pointed_thing)
        return itemstack
        end,
        on_place = function(itemstack, user, pointed_thing)
        place_handler(itemstack, user, pointed_thing) 
        return itemstack
        end,
})
end


function use_handler (itemstack,user,pointed_thing)
	local keys=user:get_player_control()
	local player_name=user:get_player_name()
	local item=itemstack:to_table()
	if item["metadata"]=="" or keys["sneak"]==true then return briefcase_setslot(user,itemstack) end
	local mode=tonumber((item["metadata"]))
	if pointed_thing.type~="node" then return end
	local pos=minetest.get_pointed_thing_position(pointed_thing,above)
	local node=minetest.env:get_node(pos)
        local node_name=node.name

	
		if minetest.registered_nodes[node_name].drawtype == "nodebox" then
	        
			end
		if node.param2==nil  then return end


			if mode==1 then
                            local pos = minetest.get_pointed_thing_position(pointed_thing, under)
                            local node = minetest.env:get_node(pos)
                            local node_name = node.name
                            local drop_name = minetest.registered_nodes[node_name].drop
                            if string.match(drop_name, "suitcase:") then
                                local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag1_inv = bag_list:get_stack('bag1', 1)

                                        if bag1_inv then
                                            local player_inv = user:get_inventory()
                                            if player_inv:is_empty('bag1') ==  true then
                                                local player_inv = user:get_inventory()
                                                bag_list:add_item('bag1', {name=drop_name})
                                                player_inv:add_item('bag1', {name=drop_name})
    
                                                local pt = pointed_thing
                                                local bag1_stack = user:get_inventory():get_stack("bag1",1)
                                                local meta =minetest.get_meta(pos)
                                                local inv = meta:get_inventory()
                                                local player_inv = user:get_inventory()
  
                                                player_inv:set_list("bag1contents", inv:get_list("main"))

                                                minetest.env:remove_node(pos)
                                                meta = minetest.env:get_meta(pos)
			                        meta:from_table(meta0)
			                        local item=itemstack:to_table()
			                        local item_wear=tonumber((item["wear"]))
			                        item_wear=item_wear+32 
			                        if item_wear>65535 then itemstack:clear() return itemstack end
			                        item["wear"]=tostring(item_wear)
			                        itemstack:replace(item)
                                                return
                                            end
                                        end
                                    end
                              end
			end

			if mode==2 then 
                            local pos = minetest.get_pointed_thing_position(pointed_thing, under)
                            local node = minetest.env:get_node(pos)
                            local node_name = node.name
                            local drop_name = minetest.registered_nodes[node_name].drop
                            if string.match(drop_name, "suitcase:") then
                                local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag2_inv = bag_list:get_stack('bag2', 1)

                                        if bag2_inv then
                                            local player_inv = user:get_inventory()
                                            if player_inv:is_empty('bag2') ==  true then
                                                local player_inv = user:get_inventory()
                                                bag_list:add_item('bag2', {name=drop_name})
                                                player_inv:add_item('bag2', {name=drop_name})
    
                                                local pt = pointed_thing
                                                local bag2_stack = user:get_inventory():get_stack("bag2",1)
                                                local meta =minetest.get_meta(pos)
                                                local inv = meta:get_inventory()
                                                local player_inv = user:get_inventory()

                                                player_inv:set_list("bag2contents", inv:get_list("main"))

                                                minetest.env:remove_node(pos)
                                                meta = minetest.env:get_meta(pos)
			                        meta:from_table(meta0)
			                        local item=itemstack:to_table()
			                        local item_wear=tonumber((item["wear"]))
			                        item_wear=item_wear+32 
			                        if item_wear>65535 then itemstack:clear() return itemstack end
			                        item["wear"]=tostring(item_wear)
			                        itemstack:replace(item)
                                                return
                                            end
                                        end
                                    end
                              end
			end
			if mode==3 then 
                            local pos = minetest.get_pointed_thing_position(pointed_thing, under)
                            local node = minetest.env:get_node(pos)
                            local node_name = node.name
                            local drop_name = minetest.registered_nodes[node_name].drop
                            if string.match(drop_name, "suitcase:") then
                                local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag3_inv = bag_list:get_stack('bag3', 1)

                                        if bag3_inv then
                                            local player_inv = user:get_inventory()
                                            if player_inv:is_empty('bag3') ==  true then
                                                local player_inv = user:get_inventory()
                                                bag_list:add_item('bag3', {name=drop_name})
                                                player_inv:add_item('bag3', {name=drop_name})
    
                                                local pt = pointed_thing
                                                local bag3_stack = user:get_inventory():get_stack("bag3",1)
                                                local meta =minetest.get_meta(pos)
                                                local inv = meta:get_inventory()
                                                local player_inv = user:get_inventory()

                                                player_inv:set_list("bag3contents", inv:get_list("main"))

                                                minetest.env:remove_node(pos)
                                                meta = minetest.env:get_meta(pos)
			                        meta:from_table(meta0)
			                        local item=itemstack:to_table()
			                        local item_wear=tonumber((item["wear"]))
			                        item_wear=item_wear+32 
			                        if item_wear>65535 then itemstack:clear() return itemstack end
			                        item["wear"]=tostring(item_wear)
			                        itemstack:replace(item)
                                                return
                                            end
                                        end
                                    end
                              end
			end
			if mode==4 then 
                            local pos = minetest.get_pointed_thing_position(pointed_thing, under)
                            local node = minetest.env:get_node(pos)
                            local node_name = node.name
                            local drop_name = minetest.registered_nodes[node_name].drop
                            if string.match(drop_name, "suitcase:") then
                                local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag4_inv = bag_list:get_stack('bag4', 1)

                                        if bag4_inv then
                                            local player_inv = user:get_inventory()
                                            if player_inv:is_empty('bag4') ==  true then
                                                local player_inv = user:get_inventory()
                                                bag_list:add_item('bag4', {name=drop_name})
                                                player_inv:add_item('bag4', {name=drop_name})
    
                                                local pt = pointed_thing
                                                local bag4_stack = user:get_inventory():get_stack("bag4",1)
                                                local meta =minetest.get_meta(pos)
                                                local inv = meta:get_inventory()
                                                local player_inv = user:get_inventory()

                                                player_inv:set_list("bag4contents", inv:get_list("main"))

                                                minetest.env:remove_node(pos)
                                                meta = minetest.env:get_meta(pos)
			                        meta:from_table(meta0)
			                        local item=itemstack:to_table()
			                        local item_wear=tonumber((item["wear"]))
			                        item_wear=item_wear+32 
			                        if item_wear>65535 then itemstack:clear() return itemstack end
			                        item["wear"]=tostring(item_wear)
			                        itemstack:replace(item)
                                                return
                                            end
                                        end
                                    end
                              end
			end
			--print (dump(axisdir..", "..rotation))
			local meta = minetest.env:get_meta(pos)
			local meta0 = meta:to_table()
			node.param2 = n
			minetest.env:set_node(pos,node)
			
			return itemstack
	
end


function place_handler (itemstack,user,pointed_thing)
	local keys=user:get_player_control()
	local player_name=user:get_player_name()
	local item=itemstack:to_table()
	if item["metadata"]=="" or keys["sneak"]==true then return briefcase_setslot(user,itemstack) end
	local mode=tonumber((item["metadata"]))
	if pointed_thing.type~="node" then return end
	local pos=minetest.get_pointed_thing_position(pointed_thing,above)
	local node=minetest.env:get_node(pos)
        local node_name=node.name

	
		if minetest.registered_nodes[node_name].drawtype == "nodebox" then
	        
			end
		if node.param2==nil  then return end


			if mode==1 then
                            local bag1_stack = user:get_inventory():get_stack("bag1",1)
                            local suitcase1_name = bag1_stack:get_name()
                            if string.match(suitcase1_name,"suitcase:") then
                                local pt = pointed_thing
                                if minetest.get_node(pt.above).name=="air" then
                                    local pt = pointed_thing
                                    local bag1_stack = user:get_inventory():get_stack("bag1",1)
                                    local suitcase1_name = bag1_stack:get_name()
                                    minetest.set_node(pt.above, {name=suitcase1_name .. "_node", param2=minetest.dir_to_facedir(user:get_look_dir())})

                                    local meta =minetest.env:get_meta(pt.above)
                                    local inv = meta:get_inventory()
                                    local player_inv = user:get_inventory()
                                    local slots1 = bag1_stack:get_definition().groups.bagslots
                                    inv:set_size("main", slots1)

                                    local empty_list1 = inv:get_list("bag1contents")
                                    inv:set_list("main", player_inv:get_list("bag1contents"))
                                    player_inv:set_list("bag1contents", empty_list1)

                                    meta = minetest.env:get_meta(pos)
			            meta:from_table(meta0)
			            local item=itemstack:to_table()
			            local item_wear=tonumber((item["wear"]))
			            item_wear=item_wear+1 
			            if item_wear>65535 then itemstack:clear() return itemstack end
			            item["wear"]=tostring(item_wear)
			            itemstack:replace(item)
--
                                    local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag1_inv = bag_list:get_stack('bag1', 1)
                                        if bag1_inv then
                                            bag_list:remove_item('bag1', bag1_inv)
                                            player_inv:remove_item('bag1', {name=suitcase1_name})
                                        end
                                    end

--
                                    return itemstack
                                    
                                end                            
                            end
			end

			if mode==2 then 
                            local bag2_stack = user:get_inventory():get_stack("bag2",1)
                            local suitcase2_name = bag2_stack:get_name()
                            if string.match(suitcase2_name,"suitcase:") then
                                local pt = pointed_thing
                                if minetest.get_node(pt.above).name=="air" then
                                    local pt = pointed_thing
                                    local bag2_stack = user:get_inventory():get_stack("bag2",1)
                                    local suitcase2_name = bag2_stack:get_name()
                                    minetest.set_node(pt.above, {name=suitcase2_name .. "_node", param2=minetest.dir_to_facedir(user:get_look_dir())})

                                    local meta =minetest.env:get_meta(pt.above)
                                    local inv = meta:get_inventory()
                                    local player_inv = user:get_inventory()
                                    local slots2 = bag2_stack:get_definition().groups.bagslots
                                    inv:set_size("main", slots2)

                                    local empty_list2 = inv:get_list("bag2contents")
                                    inv:set_list("main", player_inv:get_list("bag2contents"))
                                    player_inv:set_list("bag2contents", empty_list2)

                                    meta = minetest.env:get_meta(pos)
			            meta:from_table(meta0)
			            local item=itemstack:to_table()
			            local item_wear=tonumber((item["wear"]))
			            item_wear=item_wear+1 
			            if item_wear>65535 then itemstack:clear() return itemstack end
			            item["wear"]=tostring(item_wear)
			            itemstack:replace(item)
--
                                    local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag2_inv = bag_list:get_stack('bag2', 1)
                                        if bag2_inv then
                                            bag_list:remove_item('bag2', bag2_inv)
                                            player_inv:remove_item('bag2', {name=suitcase2_name})
                                        end
                                    end

--
                                    return itemstack
                                    
                                end                            
                            end
			end
			if mode==3 then 
				local bag3_stack = user:get_inventory():get_stack("bag3",1)
                            local suitcase3_name = bag3_stack:get_name()
                            if string.match(suitcase3_name,"suitcase:") then
                                local pt = pointed_thing
                                if minetest.get_node(pt.above).name=="air" then
                                    local pt = pointed_thing
                                    local bag3_stack = user:get_inventory():get_stack("bag3",1)
                                    local suitcase3_name = bag3_stack:get_name()
                                    minetest.set_node(pt.above, {name=suitcase3_name .. "_node", param2=minetest.dir_to_facedir(user:get_look_dir())})

                                    local meta =minetest.env:get_meta(pt.above)
                                    local inv = meta:get_inventory()
                                    local player_inv = user:get_inventory()
                                    local slots3 = bag3_stack:get_definition().groups.bagslots
                                    inv:set_size("main", slots3)

                                    local empty_list3 = inv:get_list("bag3contents")
                                    inv:set_list("main", player_inv:get_list("bag3contents"))
                                    player_inv:set_list("bag3contents", empty_list3)

                                    meta = minetest.env:get_meta(pos)
			            meta:from_table(meta0)
			            local item=itemstack:to_table()
			            local item_wear=tonumber((item["wear"]))
			            item_wear=item_wear+1 
			            if item_wear>65535 then itemstack:clear() return itemstack end
			            item["wear"]=tostring(item_wear)
			            itemstack:replace(item)
--
                                    local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag3_inv = bag_list:get_stack('bag3', 1)
                                        if bag3_inv then
                                            bag_list:remove_item('bag3', bag3_inv)
                                            player_inv:remove_item('bag3', {name=suitcase3_name})
                                        end
                                    end

--
                                    return itemstack
                                    
                                end                            
                            end
			end

			if mode==4 then 
				local bag4_stack = user:get_inventory():get_stack("bag4",1)
                            local suitcase4_name = bag4_stack:get_name()
                            if string.match(suitcase4_name,"suitcase:") then
                                local pt = pointed_thing
                                if minetest.get_node(pt.above).name=="air" then
                                    local pt = pointed_thing
                                    local bag4_stack = user:get_inventory():get_stack("bag4",1)
                                    local suitcase4_name = bag4_stack:get_name()
                                    minetest.set_node(pt.above, {name=suitcase4_name .. "_node", param2=minetest.dir_to_facedir(user:get_look_dir())})

                                    local meta =minetest.env:get_meta(pt.above)
                                    local inv = meta:get_inventory()
                                    local player_inv = user:get_inventory()
                                    local slots4 = bag4_stack:get_definition().groups.bagslots
                                    inv:set_size("main", slots4)

                                    local empty_list4 = inv:get_list("bag4contents")
                                    inv:set_list("main", player_inv:get_list("bag4contents"))
                                    player_inv:set_list("bag4contents", empty_list4)

                                    meta = minetest.env:get_meta(pos)
			            meta:from_table(meta0)
			            local item=itemstack:to_table()
			            local item_wear=tonumber((item["wear"]))
			            item_wear=item_wear+1 
			            if item_wear>65535 then itemstack:clear() return itemstack end
			            item["wear"]=tostring(item_wear)
			            itemstack:replace(item)
--
                                    local bag_list = minetest.get_inventory({type='detached', name=user:get_player_name()..'_bags'})
                                    if bag_list then
                                        local bag4_inv = bag_list:get_stack('bag4', 1)
                                        if bag4_inv then
                                            bag_list:remove_item('bag4', bag4_inv)
                                            player_inv:remove_item('bag4', {name=suitcase4_name})
                                        end
                                    end

--
                                    return itemstack
                                    
                                end                            
                            end
			end
			--print (dump(axisdir..", "..rotation))
			local meta = minetest.env:get_meta(pos)
			local meta0 = meta:to_table()
			node.param2 = n
			minetest.env:set_node(pos,node)
			
			return itemstack
	
end



slot_text={
{"Bag slot 1 selected."},
{"Bag slot 2 selected."},
{"Bag slot 3 selected."},
{"Bag slot 4 selected."},
}

function briefcase_setslot(user,itemstack)
local player_name=user:get_player_name()
local item=itemstack:to_table()
local mode
if item["metadata"]=="" then
	minetest.chat_send_player(player_name,"Hold shift and use to change bag slots.")
	mode=0
else mode=tonumber((item["metadata"]))
end
mode=mode+1
if mode==5 then mode=1 end
minetest.chat_send_player(player_name, "Briefcase mode : "..mode.." - "..slot_text[mode][1] )
item["name"]="suitcase:briefcase"..mode
item["metadata"]=tostring(mode)
itemstack:replace(item)
return itemstack
end