class Bookmark < ApplicationRecord
  belongs_to :topic
  has_many :likes, dependent: :destroy
end
