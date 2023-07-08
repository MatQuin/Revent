class RemoveDateFromActivity < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :start, :date
    remove_column :activities, :end, :date
  end
end
