class CreateArticleCategorizations < ActiveRecord::Migration
  def change
    create_table :article_categorizations do |t|
      t.references :article, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
