module AuthHelper
  def content_belongs_to?(user, content)
    content.author == user
  end
end
