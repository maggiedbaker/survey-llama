class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :completed_surveys

  validates :username, presence: true, uniqueness: true

  def can_take_survey?(survey)
    return true if CompletedSurvey.where(user_id: self.id, survey_id: survey.id).empty?
    return false
  end
end
