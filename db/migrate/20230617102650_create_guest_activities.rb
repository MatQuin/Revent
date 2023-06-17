class CreateGuestActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_activities do |t|
      t.string :role
      t.references :guest, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
