--[[
More Blocks: registrations

Copyright (c) 2011-2017 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

local default_nodes = { -- Default stairs/slabs/panels/microblocks:
	"stone",
    "ice",
    "snowblock",
	"stone_block",
	"cobble",
	"mossycobble",
	"brick",
	"sandstone",
	"steelblock",
	"goldblock",
	"copperblock",
	"bronzeblock",
	"diamondblock",
	"tinblock",
	"desert_stone",
	"desert_stone_block",
	"desert_cobble",
	"meselamp",
	"glass",
	"tree",
	"wood",
	"jungletree",
	"junglewood",
	"pine_tree",
	"pine_wood",
	"acacia_tree",
	"acacia_wood",
	"aspen_tree",
	"aspen_wood",
	"obsidian",
	"obsidian_block",
	"obsidianbrick",
	"obsidian_glass",
	"stonebrick",
	"desert_stonebrick",
	"sandstonebrick",
	"silver_sandstone",
	"silver_sandstone_brick",
	"silver_sandstone_block",
	"desert_sandstone",
	"desert_sandstone_brick",
	"desert_sandstone_block",
	"sandstone_block",
	"coral_skeleton",
	"farming:straw",
    "mobs:cheeseblock",
    "cblocks:wood_black",
    "cblocks:wood_blue",
    "cblocks:wood_brown",
    "cblocks:wood_cyan",
    "cblocks:wood_dark_green",
    "cblocks:wood_dark_grey",
    "cblocks:wood_green",
    "cblocks:wood_grey",
    "cblocks:wood_magenta",
    "cblocks:wood_orange",
    "cblocks:wood_pink",
    "cblocks:wood_red",
    "cblocks:wood_violet",
    "cblocks:wood_white",
    "cblocks:wood_yellow",

    "cblocks:stonebrick_black",
    "cblocks:stonebrick_blue",
    "cblocks:stonebrick_brown",
    "cblocks:stonebrick_cyan",
    "cblocks:stonebrick_dark_green",
    "cblocks:stonebrick_dark_grey",
    "cblocks:stonebrickgreen",
    "cblocks:stonebrick_grey",
    "cblocks:stonebrick_magenta",
    "cblocks:stonebrick_orange",
    "cblocks:stonebrick_pink",
    "cblocks:stonebrick_red",
    "cblocks:stonebrick_violet",
    "cblocks:stonebrick_white",
    "cblocks:stonebrick_yellow",

    "cblocks:glass_black",
    "cblocks:glass_blue",
    "cblocks:glass_brown",
    "cblocks:glass_cyan",
    "cblocks:glass_dark_green",
    "cblocks:glass_dark_grey",
    "cblocks:glass_green",
    "cblocks:glass_grey",
    "cblocks:glass_magenta",
    "cblocks:glass_orange",
    "cblocks:glass_pink",
    "cblocks:glass_red",
    "cblocks:glass_violet",
    "cblocks:glass_white",
    "cblocks:glass_yellow",
}

for _, name in pairs(default_nodes) do
	local nodename = "default:"..name
	local a,b = string.find(name, ":")
	if b then
		nodename = name
		name = string.sub(name, b+1)
	end
	local ndef = minetest.registered_nodes[nodename]
	if ndef then
		local drop
		if type(ndef.drop) == "string" then
			drop = ndef.drop:sub((b or 8)+1)
		end

		local tiles = ndef.tiles
		if #ndef.tiles > 1 and ndef.drawtype:find("glass") then
			tiles = { ndef.tiles[1] }
		end

		stairsplus:register_all("moreblocks", name, nodename, {
			description = ndef.description,
			drawtype = ndef.drawtype,
            paramtype = ndef.paramtype,
            drop = drop,
			groups = ndef.groups,
			sounds = ndef.sounds,
			tiles = tiles,
            use_texture_alpha = ndef.use_texture_alpha,
			sunlight_propagates = true,
			light_source = ndef.light_source
		})
	end
end

-- wool registrations

if minetest.get_modpath("wool") then

	local colorlist = {
		{"white",      "White Wool"},
		{"grey",       "Grey Wool"},
		{"black",      "Black Wool"},
		{"red",        "Red Wool"},
		{"yellow",     "Yellow Wool"},
		{"green",      "Green Wool"},
		{"cyan",       "Cyan Wool"},
		{"blue",       "Blue Wool"},
		{"magenta",    "Magenta Wool"},
		{"orange",     "Orange Wool"},
		{"violet",     "Violet Wool"},
		{"brown",      "Brown Wool"},
		{"pink",       "Pink Wool"},
		{"dark_grey",  "Dark Grey Wool"},
		{"dark_green", "Dark Green Wool"},
	}

	for i in ipairs(colorlist) do
		local color = colorlist[i][1]
		local colordesc = colorlist[i][2]

		stairsplus:register_all("wool", color, "wool:"..color, {
			description = colordesc,
			tiles = {"wool_"..color..".png"},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,
					flammable=3,wool=1,not_in_creative_inventory=1},
			sounds = default.node_sound_defaults(),
			sunlight_propagates = true,
		})
	end
end
