class CreateFlags < ActiveRecord::Migration[5.0]
  def change
    create_table :flags do |t|
      t.string :type_of_flag, :status
      t.references :flaggable, polymorphic: true, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
