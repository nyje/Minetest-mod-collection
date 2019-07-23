--
-- Register privs
minetest.register_privilege("ismod", { description = "Allows one to promote players" })
minetest.register_privilege("isplayer", { description = "Allows one to keep your creations on the server" })
minetest.register_privilege("jail", { description = "Allows one to send/release prisoners" })
minetest.register_privilege("setjail", { description = "Allows one to set the jail position and the release position" })

extras={}
extras.players_in_jail = {}
extras.path             = minetest.get_modpath("extras")
extras.defaultprivs     = minetest.setting_get("default_privs")

dofile(extras.path .. "/extras.lua")
extras.jail_data = extras.load_jail()
if not extras.jail_data then
    jail_data.jailpos = { x = 0, y = 5000, z = 0 }
    jail_data.releasepos = minetest.setting_get_pos("static_spawnpoint") or {x=0, y=15, z=0}
    extras.save_jail(jail_data)
end

extras.timespeed       = tonumber(minetest.setting_get("timespeed")) or 72
extras.nonight         = minetest.setting_getbool("nonight") or 0

-- on timer affects
-- spawn box, pingkick, jail
extras.spawnpoint       = minetest.setting_get_pos("static_spawnpoint") or {x=0, y=15, z=0}
extras.runloop          = minetest.setting_getbool("runloop") or 0
extras.boxsize          = tonumber(minetest.setting_get("playerboxsize")) or 512
extras.pingkick         = minetest.setting_getbool("pingkick") or 0
extras.jail             = minetest.setting_getbool("jail") or 0
dofile(extras.path .. "/timed.lua")

-- commands
extras.adminreset       = minetest.setting_getbool("admin_reset") or 0
extras.nospawn          = minetest.setting_getbool("no_spawn_command") or 0
extras.rollback         = minetest.setting_getbool("rollback_commands") or 0
dofile(extras.path .. "/commands.lua")


-- on punchplayer effects
-- safepvp
extras.safepvp          = tonumber(minetest.setting_get("safepvp")) or 5
dofile(extras.path .. "/onpunch.lua")

-- join/leave effects
-- autorollback, server auto-reset
extras.playerhotbar     = tonumber(minetest.setting_get("playerhotbar")) or 16
extras.autorollback     = minetest.setting_getbool("autorollback") or 0
extras.empty            = minetest.setting_getbool("empty_reset") or 0
dofile(extras.path .. "/join_leave.lua")

-- crafting extras
extras.recrafting       = minetest.setting_getbool("recrafting") or 0
dofile(extras.path .. "/craft.lua")

-- extras nodes
dofile(extras.path .. "/nodes.lua")

local materials =   {   ["dirt"]="default_dirt.png",
                        ["dirt_with_grass"]="default_grass.png",
                        ["sand"]="default_sand.png",
                        ["desert_sand"]="default_desert_sand.png",
                        ["gravel"]="default_gravel.png",
                        ["dirt_with_dry_grass"]="default_dry_grass.png",
                        ["dirt_with_rainforest_litter"]="default_rainforest_litter.png",
                        ["dirt_with_coniferous_litter"]="default_coniferous_litter.png",
                    }

for material,tiles in pairs(materials) do
    minetest.register_alias("smoothhills:panel_"..material.."_bottom","air")
    minetest.register_alias("smoothhills:panel_"..material.."_slab","air")
    minetest.register_alias("smoothhills:corner_"..material,"air")
    minetest.register_alias("smoothhills:corner_"..material.."_high","air")
end


