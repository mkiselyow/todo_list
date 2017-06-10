class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :name, presence: true
  default_scope { order("priority ASC") }

  def deadline_string
    deadline
  end

  def deadline_string=(deadline_str)
    self.deadline = Time.parse(deadline_str)
  rescue ArgumentError
    @deadline_invalid = true
  end

  def validate
    errors.add(:deadline, "is invalid") if @deadline_invalid
  end
end
