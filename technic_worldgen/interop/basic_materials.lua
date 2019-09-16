minetest.clear_craft({
        output = "basic_materials:brass_ingot",
})

minetest.register_craft( {
        type = "shapeless",
        output = "basic_materials:brass_ingot 9",
        recipe = { "basic_materials:brass_block" },
})

minetest.register_craft( {
        type = "shapeless",
        output = "basic_materials:brass_ingot 3",
        recipe = { "default:copper_ingot 2", "technic:zinc_ingot" },
})
