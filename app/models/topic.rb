class Topic < ApplicationRecord
  belongs_to :user, optional: true
end
