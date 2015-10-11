class Choice < ActiveRecord::Base
  belongs_to :question

  validates :question_id, :text, :selected, presence: true

  def percentage_chosen
    return 0 if self.question.times_answered == 0
    (self.selected / self.question.times_answered)
  end

end
