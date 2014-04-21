# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Feature.where(name: 'Adventure').first_or_create!
Feature.where(name: 'Convenience').first_or_create!
Feature.where(name: 'Bargains').first_or_create!

Category.where(name: 'Clothing').first_or_create!
Category.where(name: 'Decoration').first_or_create!
Category.where(name: 'Accesories').first_or_create!

SpaceType.where(name: 'Large').first_or_create!
SpaceType.where(name: 'Cozy').first_or_create!


LocationType.where(name: 'Urban').first_or_create!
LocationType.where(name: 'Suburban').first_or_create!

GoodsType.where(name: 'Affordable').first_or_create!
GoodsType.where(name: 'High-End').first_or_create!

AmbienceType.where(name: 'Mellow').first_or_create!
AmbienceType.where(name: 'Bustling').first_or_create!

CharacterType.where(name: 'Friendly').first_or_create!
CharacterType.where(name: 'Hands-Off').first_or_create!