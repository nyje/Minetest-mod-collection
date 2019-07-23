-- minetest.register_privilege("outlander", { description = "Can go outside the wall." })
-- minetest.register_privilege("farlander", { description = "Can go far outside the wall." })
--
--
-- --------------------------------------------------------
--
--local spawnpoint = minetest.setting_get_pos("static_spawnpoint")
--if spawnpoint == nil then
--    spawnpoint = {x=0, y=30, z=0}
--end
-- local tick = 0
local path = minetest.get_modpath("spell")
----------------------------------------------------------------------
-- local function do_services ( )
--     if tick==12 then tick=0 else tick=tick+1 end
--     for i, player in pairs(minetest.get_connected_players()) do
-- 		local name = player:get_player_name()
-- 		local privs = minetest.get_player_privs(name)
--
--         local edge = 512
--         if privs.outlander then edge = 1024 end
-- 		if privs.farlander then edge = 2048 end
--         local pos = vector.round(player:getpos())
-- 		if pos.x >= edge  or pos.x <= -edge or pos.z >= edge or pos.z <= -edge then
--             minetest.chat_send_all("player "..name.." went too far from spawn")
-- 			player:setpos(spawnpoint)
--         end
--
--         if tick==0 then
-- 			if name ~= nil then
--                 local pinf = minetest.get_player_information(name)
--                 if pinf then
--     			    local ping = pinf.avg_rtt / 2
--     			    ping = math.floor(ping * 1000)
--     			    if ping > 200 then
--         				minetest.kick_player(name, "You were kicked for high ping. This server is in LONDON, try a server closer to you or fix your internet connection")
--         				minetest.chat_send_all(name .. ". was kicked for high ping (" .. ping .. ")")
--     			    end
--                 end
-- 			end
--         end
-- 	end
--     minetest.after(5, do_services)
-- end
-- minetest.after(60, do_services)

--------------------------------------------------------
--    call the rest...

--dofile(path .. "/sitlay.lua")
dofile(path .. "/wierdnodes.lua")
--dofile(path .. "/jail.lua")
--dofile(path .. "/letters.lua")

------------------------------------------------------
-- Register stuff with the game engine

--minetest.register_privilege("setspawn", { description = "Allows one to set the spawn position." })




-- minetest.register_chatcommand("spawn", {
--     description = "Teleport player to spawn point.",
-- 	privs = {interact=true},
--     func = function ( name, param )
--         local player = minetest.get_player_by_name(name)
--         minetest.chat_send_player(player:get_player_name(), "Teleporting to spawn...")
--         player:setpos(spawnpoint)
--         return true
--     end,
-- })
--
-- minetest.register_chatcommand("afk", {
--     description = "Tell everyone you are afk.",
--     func = function ( name, param )
--         local player = minetest.get_player_by_name(name)
--         minetest.chat_send_all(name.." is AFK! ")
--         return true
--     end,
-- })


-------------------------------------------------------------------
-- alias away old mod stuff to keep the map tidy

-- minetest.register_alias("bones:bones", "air")
-- minetest.register_alias("projection_light:light_node","air")
-- minetest.register_alias("projection_light:light","cityscape:light_panel")
-- minetest.register_alias("projection_light:water_light_node","default:water_source")
-- minetest.register_alias("projection_light:water_light","cityscape:light_panel")

-- minetest.register_alias("stargate:gatenode1", "air")
-- minetest.register_alias("stargate:gatenode2", "air")
-- minetest.register_alias("stargate:gatenode3", "air")
-- minetest.register_alias("stargate:gatenode4", "air")
-- minetest.register_alias("stargate:gatenode5", "air")
-- minetest.register_alias("stargate:gatenode6", "air")
-- minetest.register_alias("stargate:gatenode7", "air")
-- minetest.register_alias("stargate:gatenode8", "air")
-- minetest.register_alias("stargate:gatenode9", "air")
-- minetest.register_alias("stargate:gatenode1_off", "air")
-- minetest.register_alias("stargate:gatenode2_off", "air")
-- minetest.register_alias("stargate:gatenode3_off", "air")
-- minetest.register_alias("stargate:gatenode4_off", "air")
-- minetest.register_alias("stargate:gatenode5_off", "air")
-- minetest.register_alias("stargate:gatenode6_off", "air")
-- minetest.register_alias("stargate:gatenode7_off", "air")
-- minetest.register_alias("stargate:gatenode8_off", "air")
-- minetest.register_alias("stargate:gatenode9_off", "air")
--minetest.register_alias("mobs:egg", "air")
-- minetest.register_alias("wardrobe:wardrobe", "air")
--minetest.register_alias("candycane:candy_block", "stone")
--for i = 1, 15 do
--	minetest.register_alias("xpanes:pane_"..i, "air")
--end



-------------------------------------------------------------------
-- END OF LIVE CODE SECTION
-------------------------------------------------------------------


-------------------------------------------------------------------
-- Disabled & held code only after this

-- minetest.register_alias("wardenpick", "jail:pick_warden")
--
-- minetest.register_node("jail:jailwall", {
-- 	description = "Unbreakable Jail Wall",
-- 	tiles = {"jail_wall.png"},
-- 	is_ground_content = true,
-- 	groups = {unbreakable=1},
-- --	sounds = default.node_sound_stone_defaults(),
-- })
--
-- minetest.register_node("jail:glass", {
-- 	description = "Unbreakable Jail Glass",
-- 	drawtype = "glasslike",
-- 	tiles = {"jail_glass.png"},
-- 	paramtype = "light",
-- 	sunlight_propagates = true,
-- 	is_ground_content = true,
-- 	groups = {unbreakable=1},
-- --	sounds = default.node_sound_glass_defaults(),
-- })
--
-- minetest.register_node("jail:ironbars", {
-- 	drawtype = "fencelike",
-- 	tiles = {"jail_ironbars.png"},
-- 	inventory_image = "jail_ironbars.png",
-- 	light_propagates = true,
-- 	paramtype = "light",
-- 	is_ground_content = true,
-- 	selection_box = {
-- 		type = "fixed",
-- 		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
-- 	},
-- 	groups = {unbreakable=1},
-- --	sounds = default.node_sound_stone_defaults(),
-- })
--
-- minetest.register_tool("jail:pick_warden", {
-- 	description = "Warden Pickaxe",
-- 	inventory_image = "jail_wardenpick.png",
-- 	tool_capabilities = {
-- 		full_punch_interval = 0,
-- 		max_drop_level=3,
-- 		groupcaps={
-- 			unbreakable={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
-- 			fleshy = {times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
-- 			choppy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
-- 			bendy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
-- 			cracky={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
-- 			crumbly={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
-- 			snappy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
-- 		}
-- 	},
-- })


