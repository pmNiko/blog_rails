class MigrateCategorizationData < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.select_all('select * from articles_categories'
    ).each do |article_category|
      article_id = article_category["article_id"]
      category_id = article_category["category_id"]
      article = Article.find(article_id)
      position = article.categories.count
      ArticleCategorization.create!(
        article_id: article_id,
        category_id: category_id,
        position: position
      )
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
