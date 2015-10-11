class AddPhotoColumnToSurveyTable < ActiveRecord::Migration
  def change
    add_column :surveys, :photo, :string
  end
end
