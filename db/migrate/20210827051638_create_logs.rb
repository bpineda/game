class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.belongs_to :project
      t.text :description,              null: false, default: ""
      t.date :entry_date
      t.timestamps
    end
  end
end
