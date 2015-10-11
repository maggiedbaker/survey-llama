class Choice < ActiveRecord::Base
  belongs_to :question

  validates :question_id, :text, :selected, presence: true
  def ascii_all_day(percentage)
    "="*(percentage/3)
  end
  def percentage_chosen
    return 0 if self.question.times_answered == 0
    percentage = ((self.selected.to_f / self.question.times_answered.to_f)*100).round
    "#{"."*(percentage/2.0)}#{percentage}"
  end
end
