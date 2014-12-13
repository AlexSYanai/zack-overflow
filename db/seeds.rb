30.times { User.create(role: "user", username: Faker::Internet.user_name, password: 'password') }
30.times { User.all.sample.posts << Post.new(content: Faker::Lorem.paragraph, title: Faker::Lorem.sentence ) }
300.times { User.all.sample.comments << Comment.new(content: Faker::Company.bs, post: Post.all.sample) }

50.times { Comment.all.sample.votes << Vote.new(voter: User.all.sample, value: -1) }
50.times { Comment.all.sample.votes << Vote.new(voter: User.all.sample, value: 1) }

50.times { Post.all.sample.votes << Vote.new(voter: User.all.sample, value: -1) }
50.times { Post.all.sample.votes << Vote.new(voter: User.all.sample, value: 1) }
