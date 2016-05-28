class DropArticlesCategories < ActiveRecord::Migration
  def up
    drop_table :articles_categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
