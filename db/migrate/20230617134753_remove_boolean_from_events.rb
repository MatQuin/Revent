class RemoveBooleanFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :boolean, :string
  end
end
