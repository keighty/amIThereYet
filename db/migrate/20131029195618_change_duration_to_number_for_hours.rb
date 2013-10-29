class ChangeDurationToNumberForHours < ActiveRecord::Migration
  def change
    change_column :hours, :duration, 'decimal USING CAST(duration AS decimal)'

  end
end
