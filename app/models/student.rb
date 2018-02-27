class Student < ApplicationRecord
  validates :name, :email, presence: true
  validate :student_over_18
  # 1. email be unique
  # 2. each student be over 18
    # dob >= 18.years.ago
  # 3. no student can be named "Matt Lawford"

  def student_over_18
    # checks whether or not the date of birth is more than 18 years ago
    # self
  end
end
