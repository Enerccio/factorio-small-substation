local trans = table.deepcopy(data.raw["electric-pole"]["small-electric-pole"])

trans.name = "transformator"
trans.supply_area_distance = 8
trans.maximum_wire_distance = 16
trans.icons = {
   {
      icon=trans.icon,
      tint={r=0,g=0,b=1,a=0.3}
   }
}
trans.minable = {mining_time = 0.1, result = "transformator"}

data.raw["electric-pole"]["transformator"] = trans

local transitem = table.deepcopy(data.raw.item["small-electric-pole"])
transitem.name = "transformator"
transitem.order = "a[energy]-a[transformator]"
transitem.place_result = "transformator"
data.raw.item["transformator"] = transitem

local recipe = table.deepcopy(data.raw.recipe["small-electric-pole"])
recipe.enabled = true
recipe.ingredients = {{"copper-cable", 30}, {"iron-plate", 10}, {"wood", 2}}
recipe.name = "transformator"
recipe.result = "transformator"

local basic_electronics = data.raw["technology"]["basic-electronics"]
table.insert(basic_electronics["effects"], {
        type = "unlock-recipe",
        recipe = "transformator"
})

data:extend{trans, recipe}
