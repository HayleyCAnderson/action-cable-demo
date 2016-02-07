class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :name, null: false
      t.text :question, null: false
    end
  end
end
