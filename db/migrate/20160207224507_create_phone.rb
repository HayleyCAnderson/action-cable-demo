class CreatePhone < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :name, null: false
      t.string :number, null: false
    end
  end
end
