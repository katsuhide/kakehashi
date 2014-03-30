# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Keyword.first_or_create([
	{ tag_type: 'sake', tag: 'dassai', search_word: '獺祭', name: '獺祭', land_of_origin: '山口' },
	{ tag_type: 'sake', tag: 'koshinokanbai', search_word: '越乃寒梅', name: '越乃寒梅', land_of_origin: '新潟' },
	{ tag_type: 'sake', tag: 'goninnmusume', search_word: '五人娘', name: '五人娘', land_of_origin: '千葉' },
])

Day.first_or_create([
	{ tag_type: 'sake', tag: 'dassai', name: '獺祭', count: 1234567, base_date: '2014/03/22' },
	{ tag_type: 'sake', tag: 'koshinokanbai', name: '越乃寒梅', count: 12345, base_date: '2014/03/22' },
	{ tag_type: 'sake', tag: 'goninnmusume', name: '五人娘', count: 9835, base_date: '2014/03/22' },
])

