Category.create(name: "Hair Care Tips")
Category.create(name: "Snowboarding")
Category.create(name: "Pittsburgh")
Category.create(name: "Skating")
Category.create(name: "EDM")
Category.create(name: "Coding Maybe")
Category.create(name: "Awesomeness")
Category.create(name: "Teaching")
Category.create(name: "Yinz")
Category.create(name: "Misc Activities")

10.times { User.create(role: "user", username: Faker::Internet.user_name, password: 'password') }
10.times { User.all.sample.posts << Post.new(content: Faker::Lorem.paragraph, title: Faker::Lorem.sentence, category_id: (1..9).to_a.sample ) }
100.times { User.all.sample.comments << Comment.new(content: Faker::Company.bs, post: Post.all.sample) }

10.times { Comment.all.sample.votes << Vote.new(voter: User.all.sample, value: -1) }
10.times { Comment.all.sample.votes << Vote.new(voter: User.all.sample, value: 1) }

10.times { Post.all.sample.votes << Vote.new(voter: User.all.sample, value: -1) }
10.times { Post.all.sample.votes << Vote.new(voter: User.all.sample, value: 1) }
