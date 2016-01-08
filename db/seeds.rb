# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  users = User.create([{ name: 'Chicago' }, { name: 'Copenhagen' }, { name: 'el maximo' }])
  Qweet.create(content: 'Big writing here', user_id: users.first.id)
  Qweet.create(content: 'small writing here', user_id: users.first.id)
  Qweet.create(content: 'Huge writing here', user_id: users.third.id)
