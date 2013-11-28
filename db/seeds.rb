# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all
User.destroy_all

suckr = ImageSuckr::GoogleSuckr.new

User.create!(
  email: "heru@project89.org",
  password: "test888",
  password_confirmation: "test888",
  role: "admin"
)

User.create!(
  email: "jimmy@joebob.com",
  password: "jimmy1",
  password_confirmation: "jimmy1",
  role: "user"
)

Product.create!(
  name: "Hutzler 571 Banana Slicer",
  url: "http://ecx.images-amazon.com/images/I/31VTJj4VuVL.jpg",
  description: "Slice an entire banana in one quick motion. Fun for children and safer than a knife. Dishwasher safe.",
  price_in_cents: 348
)

Product.create!(
  name: "Chef'n StemGem Strawberry Stem Remover",
  url: "http://ecx.images-amazon.com/images/I/61hlFHKKJ-L._SL1500_.jpg",
  description: "Remove strawberry stems with ease with the StemGem strawberry stem remover from Chef'n. It's easy to use; simply insert the StemGem into strawberry, twist and remove the strawberry stem. It removes the stem and leaves the strawberry intact! It's great for making strawberry shortcake and fruit salads. And, with the fun strawberry design, it's easy to find in the drawer. Claw made of stainless steel. Top-rack dishwasher safe. By Chef'n. Chef'n began over twenty years ago based on the principle that kitchen products could be a lot smarter, easier and more fun. Right from day one, Chef'n found an audience hungry for its brand of tasteful ingenuity. Today that legacy lives on with the precision refinements to acclaimed inventions, new technologies, design techniques and entirely new products. The StemGem Strawberry Stem Remover by Chef'n offers multiple uses in the kitchen. The StemGem makes short work of prepping fresh berries for all your cooking and baking needs. It will also core tomatoes and similar soft foods for a beautifully served dish. The StemGem is easy to use; simply insert the StemGem into strawberry, twist and remove the strawberry stem. It removes the stem and leaves the strawberry intact! The claw is made of durable stainless-steel and the tool is top-rack dishwasher safe. Its easy-to-spot strawberry design makes the tool easy to find in a drawer of other kitchen tools. Adorable and simple to use, the StemGem strawberry-stem remover appeals to both children and kitchen-gadget fiends alike. The StemGem is soon to be your new favorite tool in the kitchen!",
  price_in_cents: 665
)

Product.create!(
  name: "All Ware Stainless Steel Pineapple Easy Slicer and De-Corer",
  url: "http://ecx.images-amazon.com/images/I/61DytyiD8yL._SL1500_.jpg",
  description: "Pineapple slicer will peel, core, and slice a fresh pineapple in 30 seconds. Removes perfectly formed rings while leaving the core in the shell.",
  price_in_cents: 440
)

100.times {
    name = Faker::Commerce.product_name
    Product.create!(
      name: "#{name}",
      url: "#{suckr.get_image_url("q" => "#{name}")}",
      description: Faker::Lorem.sentences().join(' '),
      price_in_cents: Faker::Number.number(5)
    )
}