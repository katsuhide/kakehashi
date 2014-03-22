# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Day.create(tag_type: 'sake', tag: 'dassai', name: '獺祭', count: 1234567, base_date: '2014/03/22')
Day.create(tag_type: 'sake', tag: 'koshinokanbai', name: '越乃寒梅', count: 12345, base_date: '2014/03/22')
Day.create(tag_type: 'sake', tag: 'goninnmusume', name: '五人娘', count: 9835, base_date: '2014/03/22')
