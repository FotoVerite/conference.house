class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.string :name, :website, :venue_name, :country, :state, :city,
        :street_address, :postal_code
      t.date :start_date, :end_date
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.string :slug
      t.integer :listing_count, default: 0
      t.integer :lfr_count, default: 0
      t.integer :hr_count, default: 0
      t.integer :flag_count, default: 0
      t.timestamps
    end
  end
end
