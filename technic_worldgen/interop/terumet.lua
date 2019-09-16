terumet.register_repair_material("technic:uranium_ingot", 2)
terumet.register_repair_material("technic:lead_ingot", 2)
terumet.register_repair_material("technic:zinc_ingot", 5)
terumet.register_repair_material("technic:chromium_ingot", 200)
terumet.register_repair_material("technic:carbon_steel_ingot", 30)     -- default:steel_ingot + coal
terumet.register_repair_material("technic:cast_iron_ingot", 60)        -- technic:carbon_steel_ingot + coal
terumet.register_repair_material("technic:stainless_steel_ingot", 150) -- 3xtechnic:carbon_steel_ingot + technic:chromium_ingot

terumet.register_alloy_recipe({
    result="technic:carbon_steel_ingot 2",
    input={"default:steel_ingot 2", "default:coal_lump"},
    time=30,
    flux=0,
})
terumet.register_alloy_recipe({
    result="technic:carbon_steel_block 2",
    input={"default:steelblock 2", "default:coalblock"},
    time=30,
    flux=0,
})

terumet.register_alloy_recipe({
    result="technic:cast_iron_ingot 2",
    input={"technic:carbon_steel_ingot 2", "default:coal_lump"},
    time=200,
    flux=0,
})
terumet.register_alloy_recipe({
    result="technic:cast_iron_block 2",
    input={"technic:carbon_steel_block 2", "default:coalblock"},
    time=200,
    flux=0,
})

terumet.register_alloy_recipe({
    result="technic:stainless_steel_ingot 4",
    input={"technic:carbon_steel_ingot 3", "technic:chromium_ingot"},
    time=30,
    flux=0,
})
terumet.register_alloy_recipe({
    result="technic:stainless_steel_block 4",
    input={"technic:carbon_steel_block 3", "technic:chromium_block"},
    time=30,
    flux=0,
})

local uranium_crystal = terumet.register_crystal({
    suffix="uranium",
    name="Crystallized Uranium",
    cooking_result="technic:uranium_ingot",
    color="#C0FCB8",
})
local lead_crystal = terumet.register_crystal({
    suffix="lead",
    name="Crystallized Lead",
    cooking_result="technic:lead_ingot",
    color="#C6C6C6",
})
local zinc_crystal = terumet.register_crystal({
    suffix="zinc",
    name="Crystallized Zinc",
    cooking_result="technic:zinc_ingot",
    color="#DAEEF5",
})
local chromium_crystal = terumet.register_crystal({
    suffix="chromium",
    name="Crystallized Chromium",
    cooking_result="technic:chromium_ingot",
    color="#CEDDDD",
})

terumet.register_vulcan_result("technic:uranium_lump", uranium_crystal)
terumet.register_vulcan_result("technic:mineral_uranium", uranium_crystal, 1)
terumet.register_vulcan_result("technic:lead_lump", lead_crystal)
terumet.register_vulcan_result("technic:mineral_lead", lead_crystal, 1)
terumet.register_vulcan_result("technic:zinc_lump", zinc_crystal)
terumet.register_vulcan_result("technic:mineral_zinc", zinc_crystal, 1)
terumet.register_vulcan_result("technic:chromium_lump", chromium_crystal)
terumet.register_vulcan_result("technic:mineral_chromium", chromium_crystal, 1)

terumet.options.ore_saw.VALID_ORES["technic:mineral_uranium"] = 1
terumet.options.ore_saw.VALID_ORES["technic:mineral_lead"] = 1
terumet.options.ore_saw.VALID_ORES["technic:mineral_zinc"] = 1
terumet.options.ore_saw.VALID_ORES["technic:mineral_chromium"] = 1

if minetest.get_modpath("basic_materials") then
    local recipes_trimmed = {}
    for _, data in ipairs(terumet.options.smelter.recipes) do
        if data.result ~= "basic_materials:brass_ingot 3" and data.result ~= "basic_materials:brass_block 3" then
            table.insert(recipes_trimmed, data)
        end
    end
    terumet.options.smelter.recipes = recipes_trimmed

    terumet.register_alloy_recipe{result="basic_materials:brass_ingot 3", flux=0, time=4.0, input={"default:copper_lump 2", "technic:zinc_lump"}}
    terumet.register_alloy_recipe{result="basic_materials:brass_ingot 3", flux=0, time=8.0, input={"default:copper_ingot 2", "technic:zinc_ingot"}}
    terumet.register_alloy_recipe{result="basic_materials:brass_block 3", flux=0, time=40.0, input={"default:copperblock 2", "technic:zinc_block"}}
    terumet.register_alloy_recipe{result="basic_materials:brass_ingot 3", flux=0, time=2.0, input={"terumet:item_cryst_copper 2", zinc_crystal}}
end
