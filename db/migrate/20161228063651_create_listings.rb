class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :event
      t.string :name
      t.text :description
      t.string :hotel
      t.string :listing_type
      t.string :country, :state, :city, :street_address, :postal_code
      t.string :price #This should be a selectable range
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.string :slug
      t.integer :flag_count, default: 0
      t.timestamps
    end
  end
end
