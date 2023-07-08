class RemoveStatusFromEventsBis < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :status
  end
end
