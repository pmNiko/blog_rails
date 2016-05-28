class Category < ActiveRecord::Base
  has_many :article_categorizations
  has_many :articles, :through => :article_categorizations
end
