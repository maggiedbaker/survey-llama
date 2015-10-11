class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validates :survey_id, :text, presence: true

  def times_answered
    self.choices.map { |choice| choice.selected }.inject(:+)
  end
end
