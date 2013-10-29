class ChangeDurationToNumberForHours < ActiveRecord::Migration
  def change
    change_column :hours, :duration, :decimal
  end
end
