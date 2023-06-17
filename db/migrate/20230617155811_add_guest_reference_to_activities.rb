class AddGuestReferenceToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :guest, null: false, foreign_key: true
  end
end
