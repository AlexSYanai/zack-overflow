# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.destroy_all
# Category.destroy_all
# Post.destroy_all

category1 = Category.create(title:"Snowboards")
user1 = User.create(username:"Zack", password:"muffins")

post1 = Post.create(content:"Heyy you guys", creator_id:user1.id, category_id:category1.id)
post2 = Post.create(content:"Heyy youasdfasdf guys", creator_id:user1.id, category_id:category1.id)
