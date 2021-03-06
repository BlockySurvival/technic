local modpath = minetest.get_modpath("technic_worldgen")

technic = rawget(_G, "technic") or {}
technic.worldgen = {
	gettext = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end,
}

dofile(modpath.."/config.lua")
dofile(modpath.."/nodes.lua")
dofile(modpath.."/oregen.lua")
dofile(modpath.."/crafts.lua")

if minetest.get_modpath("basic_materials") then
	dofile(modpath .. "/interop/basic_materials.lua")
end

-- mg suppport
if minetest.get_modpath("mg") then
	dofile(modpath.."/mg.lua")
end

if minetest.get_modpath("moreblocks") then
	dofile(modpath.."/interop/moreblocks.lua")
end

-- Rubber trees, moretrees also supplies these
if not minetest.get_modpath("moretrees") then
	dofile(modpath.."/rubber.lua")
else
	-- older versions of technic provided rubber trees regardless
	minetest.register_alias("technic:rubber_sapling", "moretrees:rubber_tree_sapling")
	minetest.register_alias("technic:rubber_tree_empty", "moretrees:rubber_tree_trunk_empty")
end
