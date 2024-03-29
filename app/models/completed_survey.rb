class CompletedSurvey < ActiveRecord::Base
  belongs_to :survey, dependent: :destroy
  belongs_to :user

  validates :user_id, :survey_id, presence: true
end
