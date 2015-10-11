class Survey < ActiveRecord::Base

  belongs_to :user
  has_many :questions
  has_many :completed_surveys
  has_many :choices, through: :questions

  validates :user_id, :title, presence: true

  def all_choices
    self.questions.first.choices.map { |choice| [choice.text, choice.selected] }
  end

  def times_taken
    times = self.choices.map { |choice| choice.selected }.inject(:+)
    return "1 person" if times == 1
    return "#{times} people"
  end

end
