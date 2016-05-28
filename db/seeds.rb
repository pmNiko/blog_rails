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

oopCategory = Category.create!(name: 'OOP')
programingCategory = Category.create!(name: 'Programing')
smalltalkCCategory = Category.create!(name: 'Smalltalk')

for i in 0..15
  article = Article.create!({
    title: "Post number #{i}",
    text: "My #{i} post!",
    author: joeUser,
    #:categories => Category.where(:name =>['OOP', 'Programing'])
  });
  article.add_category(oopCategory)
  article.add_category(programingCategory)
end

article = Article.create!(title: 'Hi everybody!',  text: "This is Jane's first post", author: janeUser)
article.add_category(oopCategory)
article.add_category(smalltalkCCategory)
