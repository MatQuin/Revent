class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :address
      t.date :start
      t.date :end
      t.integer :price
      t.string :color
      t.string :status
      t.string :boolean
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
