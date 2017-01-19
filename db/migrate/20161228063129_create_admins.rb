class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.string   "username"
      t.string   "email"
      t.string   "password_digest",                         :default => "",   :null => false
      t.boolean  "enabled",                                 :default => true
      t.boolean  "validated",                               :default => true
      t.string   "email_validation_token"
      t.string   "remember_token"
      t.datetime "remember_token_expires_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end
  end
end
