minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_uranium",
	wherein = "default:stone",
	clust_scarcity = 32*32*16,
	clust_num_ores = 2,
	clust_size = 3,
	y_min = -3000,
	y_max = -1000,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_uranium",
	wherein = "default:stone",
	clust_scarcity = 24*24*12,
	clust_num_ores = 14,
	clust_size = 4,
	y_min = -25000,
	y_max = -3000,
})


minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_chromium",
	wherein = "default:stone",
	clust_scarcity = 32*32*16,
	clust_num_ores = 1,
	clust_size = 1,
	y_min = -1000,
	y_max = -100,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_chromium",
	wherein = "default:stone",
	clust_scarcity = 24*24*12,
	clust_num_ores = 6,
	clust_size = 3,
	y_min = -25000,
	y_max = -1000,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_zinc",
	wherein = "default:stone",
	clust_scarcity = 16*16*8,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -32,
	y_max = 2,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_zinc",
	wherein = "default:stone",
	clust_scarcity = 12*12*6,
	clust_num_ores = 4,
	clust_size = 3,
	y_min = -31000,
	y_max = -32,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_lead",
	wherein = "default:stone",
	clust_scarcity = 18*18*9,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -16,
	y_max = 16,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_lead",
	wherein = "default:stone",
	clust_scarcity = 16*16*8,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -128,
	y_max = -16,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "technic:mineral_lead",
	wherein = "default:stone",
	clust_scarcity = 12*12*6,
	clust_num_ores = 5,
	clust_size = 3,
	y_min = -31000,
	y_max = -128,
})

-- Sulfur
local sulfur_buf = {}
local sulfur_noise

minetest.register_on_generated(function(minp, maxp)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local a = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
	local data = vm:get_data(sulfur_buf)
	local pr = PseudoRandom(17 * minp.x + 42 * minp.y + 101 * minp.z)
	sulfur_noise = sulfur_noise or minetest.get_perlin(9876, 3, 0.5, 100)

	local c_lava = minetest.get_content_id("default:lava_source")
	local c_lava_flowing = minetest.get_content_id("default:lava_flowing")
	local c_stone = minetest.get_content_id("default:stone")
	local c_sulfur = minetest.get_content_id("technic:mineral_sulfur")

	local grid_size = 5
	for x = minp.x + math.floor(grid_size / 2), maxp.x, grid_size do
	for y = minp.y + math.floor(grid_size / 2), maxp.y, grid_size do
	for z = minp.z + math.floor(grid_size / 2), maxp.z, grid_size do
		local c = data[a:index(x, y, z)]
		if (c == c_lava or c == c_lava_flowing)
		and sulfur_noise:get3d({x = x, y = z, z = z}) >= 0.4 then
			for i in a:iter(
				math.max(minp.x, x - grid_size),
				math.max(minp.y, y - grid_size),
				math.max(minp.z, z - grid_size),
				math.min(maxp.x, x + grid_size),
				math.min(maxp.y, y + grid_size),
				math.min(maxp.z, z + grid_size)
			) do
				if data[i] == c_stone and pr:next(1, 10) <= 7 then
					data[i] = c_sulfur
				end
			end
		end
	end
	end
	end

	vm:set_data(data)
	vm:write_to_map(data)
end)


if technic.config:get_bool("enable_marble_generation") then
	minetest.register_ore({
		ore_type = "sheet",
		ore = "technic:marble",
		wherein = "default:stone",
		clust_scarcity = 1,
		clust_num_ores = 1,
		clust_size = 3,
		y_min = -31000,
		y_max = -50,
		noise_threshold = 0.4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 150, y = 150, z = 150},
			seed = 23, octaves = 3, persist = 0.70
		}
	})
end

if technic.config:get_bool("enable_granite_generation") then
	minetest.register_ore({
		ore_type = "sheet",
		ore = "technic:granite",
		wherein = "default:stone",
		clust_scarcity = 1,
		clust_num_ores = 1,
		clust_size = 4,
		y_min = -31000,
		y_max = -150,
		noise_threshold = 0.4,
		noise_params = {
			offset = 0, scale = 15, spread = {x = 130, y = 130, z = 130},
			seed = 24, octaves = 3, persist = 0.70
		}
	})
end
