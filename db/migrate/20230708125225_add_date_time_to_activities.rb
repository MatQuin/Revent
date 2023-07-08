class AddDateTimeToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :start, :datetime
    add_column :activities, :end, :datetime
  end
end
