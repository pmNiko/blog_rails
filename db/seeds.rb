

joeUser = User.new(
  :email                 => "joe@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
joeUser.add_role :admin
joeUser.save!

janeUser = User.new(
  :email                 => "jane@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
janeUser.save!

for i in 0..15
  Article.create!({
    title: "Post number #{i}",
    text: "My #{i} post!",
    author: joeUser
    });
  end
Article.create!(title: 'Hi everybody!',  text: "his is Jane's fist post", author: janeUser);
#Article.create!(title: 'First Post',  text: 'My first post!', author: joeUser);
#Article.create!(title: 'Second Post', text: 'Another post',   author: joeUser);
#Article.create!(title: 'Third Post',  text: 'Yet another',    author: janeUser);
