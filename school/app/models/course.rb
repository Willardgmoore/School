class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student

  has_many :assignments
  has_many :quizzes
end
