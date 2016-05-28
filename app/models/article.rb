class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5}
  validates :text, presence: true, length: {minimum: 10}
  validates :author, presence: true

  belongs_to :author, class_name: 'User'
  has_many :article_categorizations
  has_many :categories, :through => :article_categorizations
  has_many :categories, -> { order 'position DESC' }, :through => :article_categorizations

  def add_category(category)
    position = categories.count
    article_categorizations.create!(category: category, position: position)
  end
end
