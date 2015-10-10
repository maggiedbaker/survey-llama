class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :completed_surveys

  validates :username, presence: true, uniqueness: true

  def has_taken_survey?(survey)
    return false if CompletedSurvey.where(user_id: current_user.id, survey_id: survey.id).empty?
    return true
  end
end
