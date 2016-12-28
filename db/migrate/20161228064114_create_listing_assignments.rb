class CreateListingAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_assignments do |t|
      t.references :listing, :user
      t.timestamps
    end
    add_index :listing_assignments, [:listing_id, :user_id]
  end
end
