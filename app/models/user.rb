class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :completed_surveys

  validates :username, presence: true, uniqueness: true

  def has_taken_survey?(survey)
    completions = Completed_Survey.all
    return false if completions.select { |completion| completion.user_id == current_user.id && completion.survey_id == survey.id }.empty?
    return true
  end

end
