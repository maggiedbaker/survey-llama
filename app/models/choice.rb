class Choice < ActiveRecord::Base
  belongs_to :question

  validates :question_id, :text, :selected, presence: true

  def percentage_chosen
    return 0 if self.question.times_answered == 0
    ((self.selected.to_f / self.question.times_answered.to_f)*100).round
  end
end
