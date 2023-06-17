class AddGuestReferenceToPropositions < ActiveRecord::Migration[7.0]
  def change
    add_reference :propositions, :guest, null: false, foreign_key: true
  end
end
