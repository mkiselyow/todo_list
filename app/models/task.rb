class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :name, presence: true
  default_scope { order("priority ASC") }
end
