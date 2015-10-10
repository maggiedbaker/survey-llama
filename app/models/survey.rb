class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :completed_surveys

  validates :user_id, :title, presence: true

  def all_choices
    self.questions.first.choices.map { |choice| [choice.text, choice.selected] }
  end

  def current_user_can_take?
    return false if !logged_in?
    return false if current_user.has_taken_survey?(self)
    return true
  end

end
