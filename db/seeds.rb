User.create(name: "Alejandro Torres", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart")
User.create(name: "Karen Mondragon", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart")
User.create(name: "Hans Rodriges", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart")
User.create(name: "Victor Ararat", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart")
User.create(name: "Isabella Valentina", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart")
User.create(name: "Camila Rodrigues", photo:"https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80" , bio: "I am a teacher on CS Halvart")

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
