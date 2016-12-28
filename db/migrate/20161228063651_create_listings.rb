class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.string :hotel
      t.string :country, :state, :city, :address, :postal_code
      t.string :price #This should be a selectable range
      t.timestamps
    end
  end
end
