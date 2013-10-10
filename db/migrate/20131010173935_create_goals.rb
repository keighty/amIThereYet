class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user, index: true
      t.string :description
      t.text :motivation

      t.timestamps
    end
  end
end
