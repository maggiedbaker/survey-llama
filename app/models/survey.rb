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

  def has_photo?
    self.photo != nil
  end

  def self.find_keyword(search_string)
    ## there has to be a better way to query with association through tables.
    ## my joins were working properly according to pry, i can see all the foreign keys link
    ## but the error was "text" is ambiguous, maybe the since not all tables will have the same
    ## attributes?
    collection = []
    surveys = Survey.where("title LIKE ?", "%#{search_string}%")
    collection << surveys
    questions = Survey.joins(:questions).where("text LIKE ?", "%#{search_string}%")
    collection << questions
    choices = Choice.where("text LIKE ?", "%#{search_string}%")

    questions = []
    choices.each do |choice|
      questions << Survey.joins(:questions).where(id: choice.question_id)
    end
    collection << questions

    collection.flatten.uniq
  end
end
