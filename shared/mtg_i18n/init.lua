-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")


local function desc(name, description)
	if minetest.registered_items[name] then
		minetest.override_item(name, {description = description})
	end
end


--
-- Function to generate a new list of desc-calls for all currently registered items
--

local function generate_desc_overrides()
	for k,v in pairs(core.registered_items) do
		if v.description ~= "" then
			print("desc(\""..k.."\", S(\""..v.description.."\"))")
		end
	end
end


--
-- All description overrides for MTG
--

desc("air", S("Air (you hacker you!)"))
desc("beds:bed_bottom", S("Simple Bed"))
desc("beds:fancy_bed_bottom", S("Fancy Bed"))
desc("boats:boat", S("Boat"))
desc("bones:bones", S("Bones"))
desc("bucket:bucket_empty", S("Empty Bucket"))
desc("bucket:bucket_lava", S("Lava Bucket"))
desc("bucket:bucket_river_water", S("River Water Bucket"))
desc("bucket:bucket_water", S("Water Bucket"))
desc("carts:brakerail", S("Brake rail"))
desc("carts:cart", S("Cart (Sneak+Click to pick up)"))
desc("carts:powerrail", S("Powered rail"))
desc("carts:rail", S("Rail"))
desc("default:acacia_bush_leaves", S("Acacia Bush Leaves"))
desc("default:acacia_bush_sapling", S("Acacia Bush Sapling"))
desc("default:acacia_bush_stem", S("Acacia Bush Stem"))
desc("default:acacia_leaves", S("Acacia Leaves"))
desc("default:acacia_sapling", S("Acacia Tree Sapling"))
desc("default:acacia_tree", S("Acacia Tree"))
desc("default:acacia_wood", S("Acacia Wood Planks"))
desc("default:apple", S("Apple"))
desc("default:aspen_leaves", S("Aspen Leaves"))
desc("default:aspen_sapling", S("Aspen Tree Sapling"))
desc("default:aspen_tree", S("Aspen Tree"))
desc("default:aspen_wood", S("Aspen Wood Planks"))
desc("default:axe_bronze", S("Bronze Axe"))
desc("default:axe_diamond", S("Diamond Axe"))
desc("default:axe_mese", S("Mese Axe"))
desc("default:axe_steel", S("Steel Axe"))
desc("default:axe_stone", S("Stone Axe"))
desc("default:axe_wood", S("Wooden Axe"))
desc("default:book", S("Book"))
desc("default:bookshelf", S("Bookshelf"))
desc("default:book_written", S("Book With Text"))
desc("default:brick", S("Brick Block"))
desc("default:bronzeblock", S("Bronze Block"))
desc("default:bronze_ingot", S("Bronze Ingot"))
desc("default:bush_leaves", S("Bush Leaves"))
desc("default:bush_sapling", S("Bush Sapling"))
desc("default:bush_stem", S("Bush Stem"))
desc("default:cactus", S("Cactus"))
desc("default:chest_locked_open", S("Locked Chest"))
desc("default:chest_locked", S("Locked Chest"))
desc("default:chest_open", S("Chest"))
desc("default:chest", S("Chest"))
desc("default:clay_brick", S("Clay Brick"))
desc("default:clay_lump", S("Clay Lump"))
desc("default:clay", S("Clay"))
desc("default:cloud", S("Cloud"))
desc("default:coalblock", S("Coal Block"))
desc("default:coal_lump", S("Coal Lump"))
desc("default:cobble", S("Cobblestone"))
desc("default:copperblock", S("Copper Block"))
desc("default:copper_ingot", S("Copper Ingot"))
desc("default:copper_lump", S("Copper Lump"))
desc("default:coral_brown", S("Brown Coral"))
desc("default:coral_orange", S("Orange Coral"))
desc("default:coral_skeleton", S("Coral Skeleton"))
desc("default:desert_cobble", S("Desert Cobblestone"))
desc("default:desert_sand", S("Desert Sand"))
desc("default:desert_sandstone_block", S("Desert Sandstone Block"))
desc("default:desert_sandstone_brick", S("Desert Sandstone Brick"))
desc("default:desert_sandstone", S("Desert Sandstone"))
desc("default:desert_stone_block", S("Desert Stone Block"))
desc("default:desert_stonebrick", S("Desert Stone Brick"))
desc("default:desert_stone", S("Desert Stone"))
desc("default:diamondblock", S("Diamond Block"))
desc("default:diamond", S("Diamond"))
desc("default:dirt", S("Dirt"))
desc("default:dirt_with_dry_grass", S("Dirt with Dry Grass"))
desc("default:dirt_with_grass_footsteps", S("Dirt with Grass and Footsteps"))
desc("default:dirt_with_grass", S("Dirt with Grass"))
desc("default:dirt_with_rainforest_litter", S("Dirt with Rainforest Litter"))
desc("default:dirt_with_snow", S("Dirt with Snow"))
desc("default:dry_grass_1", S("Dry Grass"))
desc("default:dry_grass_2", S("Dry Grass"))
desc("default:dry_grass_3", S("Dry Grass"))
desc("default:dry_grass_4", S("Dry Grass"))
desc("default:dry_grass_5", S("Dry Grass"))
desc("default:dry_shrub", S("Dry Shrub"))
desc("default:fence_acacia_wood", S("Acacia Fence"))
desc("default:fence_aspen_wood", S("Aspen Fence"))
desc("default:fence_junglewood", S("Junglewood Fence"))
desc("default:fence_pine_wood", S("Pine Fence"))
desc("default:fence_wood", S("Wooden Fence"))
desc("default:flint", S("Flint"))
desc("default:furnace_active", S("Furnace"))
desc("default:furnace", S("Furnace"))
desc("default:glass", S("Glass"))
desc("default:goldblock", S("Gold Block"))
desc("default:gold_ingot", S("Gold Ingot"))
desc("default:gold_lump", S("Gold Lump"))
desc("default:grass_1", S("Grass"))
desc("default:grass_2", S("Grass"))
desc("default:grass_3", S("Grass"))
desc("default:grass_4", S("Grass"))
desc("default:grass_5", S("Grass"))
desc("default:gravel", S("Gravel"))
desc("default:ice", S("Ice"))
desc("default:iron_lump", S("Iron Lump"))
desc("default:junglegrass", S("Jungle Grass"))
desc("default:jungleleaves", S("Jungle Leaves"))
desc("default:junglesapling", S("Jungle Sapling"))
desc("default:jungletree", S("Jungle Tree"))
desc("default:junglewood", S("Junglewood Planks"))
desc("default:key", S("Key"))
desc("default:ladder_steel", S("Steel Ladder"))
desc("default:ladder_wood", S("Wooden Ladder"))
desc("default:lava_flowing", S("Flowing Lava"))
desc("default:lava_source", S("Lava Source"))
desc("default:leaves", S("Leaves"))
desc("default:mese_crystal_fragment", S("Mese Crystal Fragment"))
desc("default:mese_crystal", S("Mese Crystal"))
desc("default:meselamp", S("Mese Lamp"))
desc("default:mese_post_light", S("Mese Post Light"))
desc("default:mese", S("Mese Block"))
desc("default:mossycobble", S("Mossy Cobblestone"))
desc("default:obsidian_block", S("Obsidian Block"))
desc("default:obsidianbrick", S("Obsidian Brick"))
desc("default:obsidian_glass", S("Obsidian Glass"))
desc("default:obsidian_shard", S("Obsidian Shard"))
desc("default:obsidian", S("Obsidian"))
desc("default:paper", S("Paper"))
desc("default:papyrus", S("Papyrus"))
desc("default:pick_bronze", S("Bronze Pickaxe"))
desc("default:pick_diamond", S("Diamond Pickaxe"))
desc("default:pick_mese", S("Mese Pickaxe"))
desc("default:pick_steel", S("Steel Pickaxe"))
desc("default:pick_stone", S("Stone Pickaxe"))
desc("default:pick_wood", S("Wooden Pickaxe"))
desc("default:pine_needles", S("Pine Needles"))
desc("default:pine_sapling", S("Pine Sapling"))
desc("default:pine_tree", S("Pine Tree"))
desc("default:pine_wood", S("Pine Wood Planks"))
desc("default:river_water_flowing", S("Flowing River Water"))
desc("default:river_water_source", S("River Water Source"))
desc("default:sand", S("Sand"))
desc("default:sandstone_block", S("Sandstone Block"))
desc("default:sandstonebrick", S("Sandstone Brick"))
desc("default:sandstone", S("Sandstone"))
desc("default:sapling", S("Sapling"))
desc("default:shovel_bronze", S("Bronze Shovel"))
desc("default:shovel_diamond", S("Diamond Shovel"))
desc("default:shovel_mese", S("Mese Shovel"))
desc("default:shovel_steel", S("Steel Shovel"))
desc("default:shovel_stone", S("Stone Shovel"))
desc("default:shovel_wood", S("Wooden Shovel"))
desc("default:sign_wall_steel", S("Steel Sign"))
desc("default:sign_wall_wood", S("Wooden Sign"))
desc("default:silver_sand", S("Silver Sand"))
desc("default:silver_sandstone_block", S("Silver Sandstone Block"))
desc("default:silver_sandstone_brick", S("Silver Sandstone Brick"))
desc("default:silver_sandstone", S("Silver Sandstone"))
desc("default:skeleton_key", S("Skeleton Key"))
desc("default:snowblock", S("Snow Block"))
desc("default:snow", S("Snow"))
desc("default:steelblock", S("Steel Block"))
desc("default:steel_ingot", S("Steel Ingot"))
desc("default:stick", S("Stick"))
desc("default:stone_block", S("Stone Block"))
desc("default:stonebrick", S("Stone Brick"))
desc("default:stone", S("Stone"))
desc("default:stone_with_coal", S("Coal Ore"))
desc("default:stone_with_copper", S("Copper Ore"))
desc("default:stone_with_diamond", S("Diamond Ore"))
desc("default:stone_with_gold", S("Gold Ore"))
desc("default:stone_with_iron", S("Iron Ore"))
desc("default:stone_with_mese", S("Mese Ore"))
desc("default:stone_with_tin", S("Tin Ore"))
desc("default:sword_bronze", S("Bronze Sword"))
desc("default:sword_diamond", S("Diamond Sword"))
desc("default:sword_mese", S("Mese Sword"))
desc("default:sword_steel", S("Steel Sword"))
desc("default:sword_stone", S("Stone Sword"))
desc("default:sword_wood", S("Wooden Sword"))
desc("default:tinblock", S("Tin Block"))
desc("default:tin_ingot", S("Tin Ingot"))
desc("default:tin_lump", S("Tin Lump"))
desc("default:torch", S("Torch"))
desc("default:tree", S("Tree"))
desc("default:water_flowing", S("Flowing Water"))
desc("default:water_source", S("Water Source"))
desc("default:wood", S("Wooden Planks"))
desc("doors:door_glass_a", S("Glass Door"))
desc("doors:door_glass_b", S("Glass Door"))
desc("doors:door_glass", S("Glass Door"))
desc("doors:door_obsidian_glass_a", S("Obsidian Glass Door"))
desc("doors:door_obsidian_glass_b", S("Obsidian Glass Door"))
desc("doors:door_obsidian_glass", S("Obsidian Glass Door"))
desc("doors:door_steel_a", S("Steel Door"))
desc("doors:door_steel_b", S("Steel Door"))
desc("doors:door_steel", S("Steel Door"))
desc("doors:door_wood_a", S("Wooden Door"))
desc("doors:door_wood_b", S("Wooden Door"))
desc("doors:door_wood", S("Wooden Door"))
desc("doors:gate_acacia_wood_closed", S("Acacia Fence Gate"))
desc("doors:gate_acacia_wood_open", S("Acacia Fence Gate"))
desc("doors:gate_aspen_wood_closed", S("Aspen Fence Gate"))
desc("doors:gate_aspen_wood_open", S("Aspen Fence Gate"))
desc("doors:gate_junglewood_closed", S("Junglewood Fence Gate"))
desc("doors:gate_junglewood_open", S("Junglewood Fence Gate"))
desc("doors:gate_pine_wood_closed", S("Pine Fence Gate"))
desc("doors:gate_pine_wood_open", S("Pine Fence Gate"))
desc("doors:gate_wood_closed", S("Wooden Fence Gate"))
desc("doors:gate_wood_open", S("Wooden Fence Gate"))
desc("doors:hidden", S("Hidden Door Segment"))
desc("doors:trapdoor_open", S("Trapdoor"))
desc("doors:trapdoor_steel_open", S("Steel Trapdoor"))
desc("doors:trapdoor_steel", S("Steel Trapdoor"))
desc("doors:trapdoor", S("Trapdoor"))
desc("dye:black", S("Black dye"))
desc("dye:blue", S("Blue dye"))
desc("dye:brown", S("Brown dye"))
desc("dye:cyan", S("Cyan dye"))
desc("dye:dark_green", S("Dark green dye"))
desc("dye:dark_grey", S("Dark grey dye"))
desc("dye:green", S("Green dye"))
desc("dye:grey", S("Grey dye"))
desc("dye:magenta", S("Magenta dye"))
desc("dye:orange", S("Orange dye"))
desc("dye:pink", S("Pink dye"))
desc("dye:red", S("Red dye"))
desc("dye:violet", S("Violet dye"))
desc("dye:white", S("White dye"))
desc("dye:yellow", S("Yellow dye"))
desc("farming:bread", S("Bread"))
desc("farming:cotton", S("Cotton"))
desc("farming:desert_sand_soil", S("Desert Sand Soil"))
desc("farming:desert_sand_soil_wet", S("Wet Desert Sand Soil"))
desc("farming:flour", S("Flour"))
desc("farming:hoe_bronze", S("Bronze Hoe"))
desc("farming:hoe_diamond", S("Diamond Hoe"))
desc("farming:hoe_mese", S("Mese Hoe"))
desc("farming:hoe_steel", S("Steel Hoe"))
desc("farming:hoe_stone", S("Stone Hoe"))
desc("farming:hoe_wood", S("Wooden Hoe"))
desc("farming:seed_cotton", S("Cotton seed"))
desc("farming:seed_wheat", S("Wheat seed"))
desc("farming:soil", S("Soil"))
desc("farming:soil_wet", S("Wet Soil"))
desc("farming:straw", S("Straw"))
desc("farming:string", S("String"))
desc("farming:wheat", S("Wheat"))
desc("fire:flint_and_steel", S("Flint and Steel"))
desc("fire:permanent_flame", S("Permanent Flame"))
desc("flowers:dandelion_white", S("White dandelion"))
desc("flowers:dandelion_yellow", S("Yellow Dandelion"))
desc("flowers:geranium", S("Blue Geranium"))
desc("flowers:mushroom_brown", S("Brown Mushroom"))
desc("flowers:mushroom_red", S("Red Mushroom"))
desc("flowers:rose", S("Rose"))
desc("flowers:tulip", S("Orange Tulip"))
desc("flowers:viola", S("Viola"))
desc("flowers:waterlily", S("Waterlily"))
desc("ignore", S("Ignore (you hacker you!)"))
desc("screwdriver:screwdriver", S("Screwdriver (left-click rotates face, right-click rotates axis)"))
desc("stairs:slab_acacia_wood", S("Acacia Wood Slab"))
desc("stairs:slab_aspen_wood", S("Aspen Wood Slab"))
desc("stairs:slab_brick", S("Brick Slab"))
desc("stairs:slab_bronzeblock", S("Bronze Block Slab"))
desc("stairs:slab_cobble", S("Cobblestone Slab"))
desc("stairs:slab_copperblock", S("Copper Block Slab"))
desc("stairs:slab_desert_cobble", S("Desert Cobblestone Slab"))
desc("stairs:slab_desert_sandstone_block", S("Desert Sandstone Block Slab"))
desc("stairs:slab_desert_sandstone_brick", S("Desert Sandstone Brick Slab"))
desc("stairs:slab_desert_sandstone", S("Desert Sandstone Slab"))
desc("stairs:slab_desert_stone_block", S("Desert Stone Block Slab"))
desc("stairs:slab_desert_stonebrick", S("Desert Stone Brick Slab"))
desc("stairs:slab_desert_stone", S("Desert Stone Slab"))
desc("stairs:slab_goldblock", S("Gold Block Slab"))
desc("stairs:slab_ice", S("Ice Slab"))
desc("stairs:slab_junglewood", S("Jungle Wood Slab"))
desc("stairs:slab_mossycobble", S("Mossy Cobblestone Slab"))
desc("stairs:slab_obsidian_block", S("Obsidian Block Slab"))
desc("stairs:slab_obsidianbrick", S("Obsidian Brick Slab"))
desc("stairs:slab_obsidian", S("Obsidian Slab"))
desc("stairs:slab_pine_wood", S("Pine Wood Slab"))
desc("stairs:slab_sandstone_block", S("Sandstone Block Slab"))
desc("stairs:slab_sandstonebrick", S("Sandstone Brick Slab"))
desc("stairs:slab_sandstone", S("Sandstone Slab"))
desc("stairs:slab_silver_sandstone_block", S("Silver Sandstone Block Slab"))
desc("stairs:slab_silver_sandstone_brick", S("Silver Sandstone Brick Slab"))
desc("stairs:slab_silver_sandstone", S("Silver Sandstone Slab"))
desc("stairs:slab_snowblock", S("Snow Block Slab"))
desc("stairs:slab_steelblock", S("Steel Block Slab"))
desc("stairs:slab_stone_block", S("Stone Block Slab"))
desc("stairs:slab_stonebrick", S("Stone Brick Slab"))
desc("stairs:slab_stone", S("Stone Slab"))
desc("stairs:slab_straw", S("Straw Slab"))
desc("stairs:slab_tinblock", S("Tin Block Slab"))
desc("stairs:slab_wood", S("Wooden Slab"))
desc("stairs:stair_acacia_wood", S("Acacia Wood Stair"))
desc("stairs:stair_aspen_wood", S("Aspen Wood Stair"))
desc("stairs:stair_brick", S("Brick Stair"))
desc("stairs:stair_bronzeblock", S("Bronze Block Stair"))
desc("stairs:stair_cobble", S("Cobblestone Stair"))
desc("stairs:stair_copperblock", S("Copper Block Stair"))
desc("stairs:stair_desert_cobble", S("Desert Cobblestone Stair"))
desc("stairs:stair_desert_sandstone_block", S("Desert Sandstone Block Stair"))
desc("stairs:stair_desert_sandstone_brick", S("Desert Sandstone Brick Stair"))
desc("stairs:stair_desert_sandstone", S("Desert Sandstone Stair"))
desc("stairs:stair_desert_stone_block", S("Desert Stone Block Stair"))
desc("stairs:stair_desert_stonebrick", S("Desert Stone Brick Stair"))
desc("stairs:stair_desert_stone", S("Desert Stone Stair"))
desc("stairs:stair_goldblock", S("Gold Block Stair"))
desc("stairs:stair_ice", S("Ice Stair"))
desc("stairs:stair_junglewood", S("Jungle Wood Stair"))
desc("stairs:stair_mossycobble", S("Mossy Cobblestone Stair"))
desc("stairs:stair_obsidian_block", S("Obsidian Block Stair"))
desc("stairs:stair_obsidianbrick", S("Obsidian Brick Stair"))
desc("stairs:stair_obsidian", S("Obsidian Stair"))
desc("stairs:stair_pine_wood", S("Pine Wood Stair"))
desc("stairs:stair_sandstone_block", S("Sandstone Block Stair"))
desc("stairs:stair_sandstonebrick", S("Sandstone Brick Stair"))
desc("stairs:stair_sandstone", S("Sandstone Stair"))
desc("stairs:stair_silver_sandstone_block", S("Silver Sandstone Block Stair"))
desc("stairs:stair_silver_sandstone_brick", S("Silver Sandstone Brick Stair"))
desc("stairs:stair_silver_sandstone", S("Silver Sandstone Stair"))
desc("stairs:stair_snowblock", S("Snow Block Stair"))
desc("stairs:stair_steelblock", S("Steel Block Stair"))
desc("stairs:stair_stone_block", S("Stone Block Stair"))
desc("stairs:stair_stonebrick", S("Stone Brick Stair"))
desc("stairs:stair_stone", S("Stone Stair"))
desc("stairs:stair_straw", S("Straw Stair"))
desc("stairs:stair_tinblock", S("Tin Block Stair"))
desc("stairs:stair_wood", S("Wooden Stair"))
desc("stairs:stair_inner_acacia_wood", S("Acacia Wood Stair Inner"))
desc("stairs:stair_inner_aspen_wood", S("Aspen Wood Stair Inner"))
desc("stairs:stair_inner_brick", S("Brick Stair Inner"))
desc("stairs:stair_inner_bronzeblock", S("Bronze Block Stair Inner"))
desc("stairs:stair_inner_cobble", S("Cobblestone Stair Inner"))
desc("stairs:stair_inner_copperblock", S("Copper Block Stair Inner"))
desc("stairs:stair_inner_desert_cobble", S("Desert Cobblestone Stair Inner"))
desc("stairs:stair_inner_desert_sandstone_block", S("Desert Sandstone Block Stair Inner"))
desc("stairs:stair_inner_desert_sandstone_brick", S("Desert Sandstone Brick Stair Inner"))
desc("stairs:stair_inner_desert_sandstone", S("Desert Sandstone Stair Inner"))
desc("stairs:stair_inner_desert_stone_block", S("Desert Stone Block Stair Inner"))
desc("stairs:stair_inner_desert_stonebrick", S("Desert Stone Brick Stair Inner"))
desc("stairs:stair_inner_desert_stone", S("Desert Stone Stair Inner"))
desc("stairs:stair_inner_goldblock", S("Gold Block Stair Inner"))
desc("stairs:stair_inner_ice", S("Ice Stair Inner"))
desc("stairs:stair_inner_junglewood", S("Jungle Wood Stair Inner"))
desc("stairs:stair_inner_mossycobble", S("Mossy Cobblestone Stair Inner"))
desc("stairs:stair_inner_obsidian_block", S("Obsidian Block Stair Inner"))
desc("stairs:stair_inner_obsidianbrick", S("Obsidian Brick Stair Inner"))
desc("stairs:stair_inner_obsidian", S("Obsidian Stair Inner"))
desc("stairs:stair_inner_pine_wood", S("Pine Wood Stair Inner"))
desc("stairs:stair_inner_sandstone_block", S("Sandstone Block Stair Inner"))
desc("stairs:stair_inner_sandstonebrick", S("Sandstone Brick Stair Inner"))
desc("stairs:stair_inner_sandstone", S("Sandstone Stair Inner"))
desc("stairs:stair_inner_silver_sandstone_block", S("Silver Sandstone Block Stair Inner"))
desc("stairs:stair_inner_silver_sandstone_brick", S("Silver Sandstone Brick Stair Inner"))
desc("stairs:stair_inner_silver_sandstone", S("Silver Sandstone Stair Inner"))
desc("stairs:stair_inner_snowblock", S("Snow Block Stair Inner"))
desc("stairs:stair_inner_steelblock", S("Steel Block Stair Inner"))
desc("stairs:stair_inner_stone_block", S("Stone Block Stair Inner"))
desc("stairs:stair_inner_stonebrick", S("Stone Brick Stair Inner"))
desc("stairs:stair_inner_stone", S("Stone Stair Inner"))
desc("stairs:stair_inner_straw", S("Straw Stair Inner"))
desc("stairs:stair_inner_tinblock", S("Tin Block Stair Inner"))
desc("stairs:stair_inner_wood", S("Wooden Stair Inner"))
desc("stairs:stair_outer_acacia_wood", S("Acacia Wood Stair Outer"))
desc("stairs:stair_outer_aspen_wood", S("Aspen Wood Stair Outer"))
desc("stairs:stair_outer_brick", S("Brick Stair Outer"))
desc("stairs:stair_outer_bronzeblock", S("Bronze Block Stair Outer"))
desc("stairs:stair_outer_cobble", S("Cobblestone Stair Outer"))
desc("stairs:stair_outer_copperblock", S("Copper Block Stair Outer"))
desc("stairs:stair_outer_desert_cobble", S("Desert Cobblestone Stair Outer"))
desc("stairs:stair_outer_desert_sandstone_block", S("Desert Sandstone Block Stair Outer"))
desc("stairs:stair_outer_desert_sandstone_brick", S("Desert Sandstone Brick Stair Outer"))
desc("stairs:stair_outer_desert_sandstone", S("Desert Sandstone Stair Outer"))
desc("stairs:stair_outer_desert_stone_block", S("Desert Stone Block Stair Outer"))
desc("stairs:stair_outer_desert_stonebrick", S("Desert Stone Brick Stair Outer"))
desc("stairs:stair_outer_desert_stone", S("Desert Stone Stair Outer"))
desc("stairs:stair_outer_goldblock", S("Gold Block Stair Outer"))
desc("stairs:stair_outer_ice", S("Ice Stair Outer"))
desc("stairs:stair_outer_junglewood", S("Jungle Wood Stair Outer"))
desc("stairs:stair_outer_mossycobble", S("Mossy Cobblestone Stair Outer"))
desc("stairs:stair_outer_obsidian_block", S("Obsidian Block Stair Outer"))
desc("stairs:stair_outer_obsidianbrick", S("Obsidian Brick Stair Outer"))
desc("stairs:stair_outer_obsidian", S("Obsidian Stair Outer"))
desc("stairs:stair_outer_pine_wood", S("Pine Wood Stair Outer"))
desc("stairs:stair_outer_sandstone_block", S("Sandstone Block Stair Outer"))
desc("stairs:stair_outer_sandstonebrick", S("Sandstone Brick Stair Outer"))
desc("stairs:stair_outer_sandstone", S("Sandstone Stair Outer"))
desc("stairs:stair_outer_silver_sandstone_block", S("Silver Sandstone Block Stair Outer"))
desc("stairs:stair_outer_silver_sandstone_brick", S("Silver Sandstone Brick Stair Outer"))
desc("stairs:stair_outer_silver_sandstone", S("Silver Sandstone Stair Outer"))
desc("stairs:stair_outer_snowblock", S("Snow Block Stair Outer"))
desc("stairs:stair_outer_steelblock", S("Steel Block Stair Outer"))
desc("stairs:stair_outer_stone_block", S("Stone Block Stair Outer"))
desc("stairs:stair_outer_stonebrick", S("Stone Brick Stair Outer"))
desc("stairs:stair_outer_stone", S("Stone Stair Outer"))
desc("stairs:stair_outer_straw", S("Straw Stair Outer"))
desc("stairs:stair_outer_tinblock", S("Tin Block Stair Outer"))
desc("stairs:stair_outer_wood", S("Wooden Stair Outer"))
desc("tnt:gunpowder", S("Gun Powder"))
desc("tnt:tnt", S("TNT"))
desc("unknown", S("Unknown Item"))
desc("vessels:drinking_glass", S("Drinking Glass (empty)"))
desc("vessels:glass_bottle", S("Glass Bottle (empty)"))
desc("vessels:glass_fragments", S("Pile of Glass Fragments"))
desc("vessels:shelf", S("Vessels Shelf"))
desc("vessels:steel_bottle", S("Heavy Steel Bottle (empty)"))
desc("walls:cobble", S("Cobblestone Wall"))
desc("walls:desertcobble", S("Desert Cobblestone Wall"))
desc("walls:mossycobble", S("Mossy Cobblestone Wall"))
desc("wool:black", S("Black Wool"))
desc("wool:blue", S("Blue Wool"))
desc("wool:brown", S("Brown Wool"))
desc("wool:cyan", S("Cyan Wool"))
desc("wool:dark_green", S("Dark Green Wool"))
desc("wool:dark_grey", S("Dark Grey Wool"))
desc("wool:green", S("Green Wool"))
desc("wool:grey", S("Grey Wool"))
desc("wool:magenta", S("Magenta Wool"))
desc("wool:orange", S("Orange Wool"))
desc("wool:pink", S("Pink Wool"))
desc("wool:red", S("Red Wool"))
desc("wool:violet", S("Violet Wool"))
desc("wool:white", S("White Wool"))
desc("wool:yellow", S("Yellow Wool"))
desc("xpanes:bar_flat", S("Iron bar"))
desc("xpanes:bar", S("Iron bar"))
desc("xpanes:pane_flat", S("Glass Pane"))
desc("xpanes:pane", S("Glass Pane"))


--
-- Legacy
--

desc("nyancat:nyancat_rainbow", S("Nyan Cat Rainbow"))
desc("nyancat:nyancat", S("Nyan Cat"))