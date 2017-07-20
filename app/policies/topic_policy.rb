class TopicPolicy < ApplicationPolicy

  def update?
    user.present? && (record.topic.user == user)
  end
end
