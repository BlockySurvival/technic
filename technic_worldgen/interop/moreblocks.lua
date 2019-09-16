local function register(recipe_item)
    local modname, subname = recipe_item:match('^([^:]+):([^:]+)$')
    local def              = minetest.registered_nodes[recipe_item]
    stairsplus:register_all(modname, subname, recipe_item, def)
end

register("technic:uranium_block")
register("technic:zinc_block")
register("technic:lead_block")
register("technic:chromium_block")
register("technic:carbon_steel_block")
register("technic:cast_iron_block")
register("technic:stainless_steel_block")

