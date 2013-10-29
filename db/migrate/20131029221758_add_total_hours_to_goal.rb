class AddTotalHoursToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :total_hours, :float
  end
end
