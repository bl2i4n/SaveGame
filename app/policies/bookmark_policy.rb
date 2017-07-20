class BookmarkPolicy < ApplicationPolicy

  def update?
    user.present? && (record.topic.user == user)
  end
end
