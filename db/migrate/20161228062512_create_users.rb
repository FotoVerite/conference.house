class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   "first_name",                :limit => 50
      t.string   "last_name",                 :limit => 50
      t.string   "username"
      t.string   "email"
      t.string   "password_digest",                         :default => "",   :null => false
      t.boolean  "enabled",                                 :default => true
      t.string   "remember_token",            :limit => 40
      t.datetime "remember_token_expires_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end
  end
end
