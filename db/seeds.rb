# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative './character_data.rb'
require_relative './house_data.rb'

Character.destroy_all
House.destroy_all

character_data = get_character_data()
house_data = get_house_data()

character_data.each_pair do |house_name, characters|
  info = house_data[house_name]
  current_house = House.create!({
    name:         info[:name],
    sigil:     	  info[:sigil]
  })

  characters.each do |character|
    Character.create!({
      character_name:        character[:character_name],
      house:       			 current_house
    })
  end
end
