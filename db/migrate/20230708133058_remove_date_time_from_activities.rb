class RemoveDateTimeFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :start, :datetime
    remove_column :activities, :end, :datetime
  end
end
