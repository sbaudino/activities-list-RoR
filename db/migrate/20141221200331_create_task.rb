class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :date
      t.boolean :active
      t.references :list, index: true
      
      t.timestamps
    end
  end
end
