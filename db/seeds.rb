User.create(name: "Alejandro Torres", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart", email: 'test@test.com', password: '123456')
User.create(name: "Karen Mondragon", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart",email: 'test2@test.com', password: '223456')
User.create(name: "Hans Rodriges", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart",email: 'test3@test.com', password: '323456')
User.create(name: "Victor Ararat", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart",email: 'test4@test.com', password: '423456')
User.create(name: "Isabella Valentina", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart",email: 'test5@test.com', password: '523456')
User.create!(name: "Camila Rodrigues", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart",email: 'test6@test.com', password: '623456')

100.times do |post|
  Post.create(title: "#{post}-Post",
      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo velit. Maecenas quis tortor nec neque ornare pharetra vitae in quam. Phasellus dapibus a dui at euismod. Suspendisse ac cursus ligula. Pellentesque in augue sit amet ipsum condimentum facilisis. Aenean rutrum feugiat condimentum.",
      user_id: (rand(1..6)))
end

200.times do |comment|
  Comment.create(
      user_id: (rand(1..6)),
      post_id: (rand(1..100)),
      text: "Phasellus dapibus a dui at euismod." )
end

300.times do |like|
  Like.create(user_id: (rand(1..10)), post_id: (rand(1..100)))
end
