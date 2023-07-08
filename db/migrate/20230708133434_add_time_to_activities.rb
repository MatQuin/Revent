class AddTimeToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :start, :time
    add_column :activities, :end, :time
  end
end
