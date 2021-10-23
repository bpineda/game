class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :suit,              null: false, default: ""
      # Global numeric value for the card.
      t.integer :numeric_value,              null: false, default: ""
      t.timestamps
      t.belongs_to :hand
    end
  end
end
