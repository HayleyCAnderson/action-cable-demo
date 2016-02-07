class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :survey, foreign_key: true, null: false
      t.integer :number, null: false
      t.text :text, null: false
    end
  end
end
