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
Category.where(name: 'Decorations').first_or_create!
Category.where(name: 'Accessories').first_or_create!

Style.where(name: 'Traditional').first_or_create!
Style.where(name: 'Contemporary').first_or_create!
Style.where(name: 'Vintage').first_or_create!
Style.where(name: 'Rustic').first_or_create!
Style.where(name: 'Outdoor').first_or_create!
Style.where(name: 'Ethnic').first_or_create!

SpaceType.where(name: 'Large').first_or_create!
SpaceType.where(name: 'Cozy').first_or_create!

LocationType.where(name: 'Urban').first_or_create!
LocationType.where(name: 'Suburban').first_or_create!

AccessType.where(name: 'Transit').first_or_create!
AccessType.where(name: 'Parking').first_or_create!

GoodsType.where(name: 'Affordable').first_or_create!
GoodsType.where(name: 'High-End').first_or_create!

AmbienceType.where(name: 'Mellow').first_or_create!
AmbienceType.where(name: 'Bustling').first_or_create!

CharacterType.where(name: 'Friendly').first_or_create!
CharacterType.where(name: 'Hands-Off').first_or_create!

Scent.where(name: 'Wood').first_or_create!
Scent.where(name: 'Floral').first_or_create!
Scent.where(name: 'Fruit').first_or_create!
Scent.where(name: 'Spice').first_or_create!
Scent.where(name: 'Sweet').first_or_create!
Scent.where(name: 'Incense').first_or_create!
Scent.where(name: 'Perfume').first_or_create!
Scent.where(name: 'Musk').first_or_create!
Scent.where(name: 'Clean').first_or_create!
Scent.where(name: 'Chemical').first_or_create!

AirType.where(name: 'Bright').first_or_create!
AirType.where(name: 'Dark').first_or_create!
AirType.where(name: 'Sunny').first_or_create!
AirType.where(name: 'Dusty').first_or_create!
AirType.where(name: 'Musty').first_or_create!
AirType.where(name: 'Breezy').first_or_create!
AirType.where(name: 'Chilly').first_or_create!
AirType.where(name: 'Warm').first_or_create!

MusicStyle.where(name: 'No Music').first_or_create!
MusicStyle.where(name: 'Indie Rock').first_or_create!
MusicStyle.where(name: 'Classic Rock').first_or_create!
MusicStyle.where(name: 'Hard Rock').first_or_create!
MusicStyle.where(name: 'Rap/R&B').first_or_create!
MusicStyle.where(name: 'Pop').first_or_create!
MusicStyle.where(name: 'Folk/Americana').first_or_create!
MusicStyle.where(name: 'Country').first_or_create!
MusicStyle.where(name: 'Easy Listening/Adult Contemporary').first_or_create!
MusicStyle.where(name: 'Jazz/Blues').first_or_create!
MusicStyle.where(name: 'Classical').first_or_create!
MusicStyle.where(name: 'World').first_or_create!
MusicStyle.where(name: 'Jam Bands').first_or_create!
MusicStyle.where(name: 'Electronic').first_or_create!
