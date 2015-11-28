# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
	#Article.create( source_url: "url ##{i}")
	Article.create( source_url: "http://mp.weixin.qq.com/s?__biz=MzAwMDE3NjkxMg==&mid=400599477&idx=1&sn=b945b4ca89e7bd1c903b0ad20bfa9a2e&scene=4#wechat_redirect" )
end
