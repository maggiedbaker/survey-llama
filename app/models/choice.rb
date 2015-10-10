class Choice < ActiveRecord::Base
  belongs_to :question

  validates :question_id, :text, :selected, presence: true
end
