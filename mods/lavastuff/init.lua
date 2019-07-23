--
-- Crafitems
--

minetest.register_craftitem("lavastuff:ingot", {
description = "Lava ingot",
inventory_image = "lavastuff_ingot.png",
})

minetest.register_craft({
--    type = 'shapeless',
    output = 'lavastuff:ingot',
    recipe = {
        {"default:mese_crystal","default:mese_crystal","default:mese_crystal"},
        {"default:mese_crystal","mobs:lava_orb","default:mese_crystal"},
        {"default:mese_crystal","default:mese_crystal","default:mese_crystal"}
    }
})

--
-- Armor
--

minetest.register_tool("lavastuff:helmet", {
		description = "Lava Helmet",
		inventory_image = "lavastuff_inv_helmet.png",
		groups = {armor_head=25, armor_heal=24, armor_use=100, armor_fire=30},
		wear = 0,
	})
	minetest.register_tool("lavastuff:chestplate", {
		description = "Lava Chestplate",
		inventory_image = "lavastuff_inv_chestplate.png",
		groups = {armor_torso=30, armor_heal=24, armor_use=100, armor_fire=30},
		wear = 0,
	})
	minetest.register_tool("lavastuff:leggings", {
		description = "Lava Leggings",
		inventory_image = "lavastuff_inv_leggings.png",
		groups = {armor_legs=30, armor_heal=24, armor_use=100, armor_fire=30},
		wear = 0,
	})
	minetest.register_tool("lavastuff:boots", {
		description = "Lava Boots",
		inventory_image = "lavastuff_inv_boots.png",
		groups = {armor_feet=25, armor_heal=24, armor_use=100, armor_fire=30},
		wear = 0,
  })
        minetest.register_tool("lavastuff:shield", {
		description = "Lava Shield",
		inventory_image = "lavastuff_inven_shield.png",
		groups = {armor_shield=25, armor_heal=24, armor_use=100, armor_fire=30},
		wear = 0,
	})

  --
  -- Armor Crafts
  --

  minetest.register_craft({
  	output = 'lavastuff:helmet',
  	recipe = {
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  		{'lavastuff:ingot', '', 'lavastuff:ingot'},
  		{'', '', ''},
  	}
  })
  minetest.register_craft({
  	output = 'lavastuff:chestplate',
  	recipe = {
  		{'lavastuff:ingot', '', 'lavastuff:ingot'},
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  	}
  })
  minetest.register_craft({
  	output = 'lavastuff:leggings',
  	recipe = {
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  		{'lavastuff:ingot', '', 'lavastuff:ingot'},
  		{'lavastuff:ingot', '', 'lavastuff:ingot'},
  	}
  })
  minetest.register_craft({
  	output = 'lavastuff:boots',
  	recipe = {
  		{'', '', ''},
  		{'lavastuff:ingot', '', 'lavastuff:ingot'},
  		{'lavastuff:ingot', '', 'lavastuff:ingot'},
  	}
  })
  minetest.register_craft({
  	output = 'lavastuff:shield',
  	recipe = {
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  		{'', 'lavastuff:ingot', ''},
  	}
  })--
--Toolranks support
--




  --
  -- Nodes
  --

--   minetest.register_node ("lavastuff:block", {
--   	description = "Lava Block",
--   	tiles = {"lavastuff_block.png"},
--   	is_ground_content = false,
--   	sounds = default.node_sound_stone_defaults(),
--   	groups = {cracky = 1, level = 2},
--   	light_source = default.LIGHT_MAX,
--   })
--   minetest.register_node("lavastuff:stair", {
--     description = 'Lava Stair',
--     drawtype = "mesh",
--     mesh = "stairs_stair.obj",
--     tiles = {"lavastuff_block.png"},
--     paramtype = "light",
--     paramtype2 = "facedir",
--     is_ground_content = false,
--     groups = {cracky = 1, level = 2},
--     light_source = default.LIGHT_MAX,
--     selection_box = {
--       type = "fixed",
--       fixed = {
--         {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
--         {-0.5, 0, 0, 0.5, 0.5, 0.5},
--       },
--     },
--     collision_box = {
--       type = "fixed",
--       fixed = {
--         {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
--         {-0.5, 0, 0, 0.5, 0.5, 0.5},
--       },
--     },
--   })
--   minetest.register_node("lavastuff:slab", {
--       description = "Lava Slab",
--       drawtype = "nodebox",
--       tiles = {"lavastuff_block.png"},
--       paramtype = "light",
--       groups = {cracky = 1, level = 2},
--     	light_source = default.LIGHT_MAX,
--       node_box = {
--           type = "fixed",
--           fixed = {-0.5, -0.5, -0.5, 0.5, 0.0, 0.5}
--       }
--   })

  --
  -- Node Crafts
  --

  minetest.register_craft({
  	output = 'lavastuff:block',
  	recipe = {
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  		{'lavastuff:ingot', 'lavastuff:ingot', 'lavastuff:ingot'},
  	}
  })
  minetest.register_craft ({
  output = "lavastuff:stair 6",
  recipe = {
  {'', '', 'lavastuff:block'},
  {'', 'lavastuff:block', 'lavastuff:block'},
  {'lavastuff:block', 'lavastuff:block', 'lavastuff:block'}
  }
  })
  minetest.register_craft ({
  type = 'shapeless',
  output = "lavastuff:slab 4",
  recipe = {'lavastuff:block', 'lavastuff:block'}
  })

