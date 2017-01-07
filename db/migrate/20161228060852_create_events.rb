class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, :website, :venue_name, :country, :state, :city,
        :street_address, :postal_code
      t.date :start_date, :end_date
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.timestamps
    end
  end
end
