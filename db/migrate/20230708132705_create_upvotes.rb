class CreateUpvotes < ActiveRecord::Migration[7.0]
  def change
    create_table :upvotes do |t|
      t.references :guest, null: false, foreign_key: true
      t.references :proposition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
