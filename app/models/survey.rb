class Survey < ActiveRecord::Base

  belongs_to :user
  has_many :questions
  has_many :completed_surveys

  validates :user_id, :title, presence: true

  def current_user_can_take?
    return false if !logged_in?
    return false if self.current_user_has_taken?
    return true
  end

  def current_user_has_taken?
    return false if CompletedSurvey.where(user_id: current_user.id, survey_id: self.id).empty?
    return true
  end

end
