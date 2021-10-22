class CreateHands < ActiveRecord::Migration[6.1]
  def change
    create_table :hands do |t|
      t.string :rank,              null: false, default: ""
      t.timestamps
      t.belongs_to :round
    end
  end
end
