class Job < ApplicationRecord
  validates :title, :description, presence: true
  validate :has_at_least_one_skill

  def has_at_least_one_skill
    if skills.length < 1
      errors.add(:skills, "There must be at least one skill")
    end
  end
end
