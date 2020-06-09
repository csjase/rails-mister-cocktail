# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get(url)
keys = JSON.parse(response)
keys['drinks'].each do |key|
  ingredient = Ingredient.new(name: key['strIngredient1'])
  ingredient.save
  puts "added #{key['strIngredient1']}"
end


# open(url) do |stream| ALTERNATIVE WAY
#   drinks = JSON.parse(stream.read)
#   drinks['drinks'].each do |d|
#     ingredient = d['strIngredient1']
#     Ingredient.create(name: ingredient)
#   end
# end