class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id, null: false
      t.string :text, null: false
      t.integer :selected, null: false, default: 0

      t.timestamps null: false
    end
  end
end
