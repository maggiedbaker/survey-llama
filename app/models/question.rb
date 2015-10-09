class Question < ActiveRecord::Base

  belongs_to :survey_id
  has_many :choices

  validates :survey_id, :text, presence: true
end
