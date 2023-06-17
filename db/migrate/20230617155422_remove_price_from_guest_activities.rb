class RemovePriceFromGuestActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :guest_activities, :role, :string
  end
end
