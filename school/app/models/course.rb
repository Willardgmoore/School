class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student

  has_many :assignments, dependent: :destroy
  has_many :quizzes, dependent: :destroy
end
