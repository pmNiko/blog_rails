class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def update
    record.author == user
  end

  def create?
    record.author == user
  end

  def new?
    user.present?
  end

  def destroy
    record.author == user
  end
end
