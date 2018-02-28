class Student < ApplicationRecord
  belongs_to :cohort

  validates :email, presence: true
  # validates :name, exclusion:
  validates :email, uniqueness: true
  validate :student_over_18, :not_matt_lawford
  # 1. email be unique
  # 2. each student be over 18
    # dob >= 18.years.ago
  # 3. no student can be named "Matt Lawford"

  def student_over_18
    # checks whether or not the date of birth is more than 18 years ago
    if dob && dob.to_date >= 18.years.ago
      self.errors.add(:dob, 'Student must be at least 18')
    end
  end

  def not_matt_lawford
    if name && self.name == 'Matt Lawford'
      errors.add(:name, "You can't be matt")
    end
  end
end
