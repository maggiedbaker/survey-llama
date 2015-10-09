class CreateCompletedSurveys < ActiveRecord::Migration
  def change
    create_table :completed_surveys do |t|
      t.integer :survey_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
