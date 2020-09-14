class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.references :user, index: true
      t.string :device_uuid, null: false
      t.string :os_type, null: false
      t.string :os_version, null: false
      t.string :app_version, null: false
      t.string :app_build_code, null: false
      t.string :manufacturer
      t.string :model
      t.timestamps
    end

    add_index :devices, :device_uuid, unique: true
  end
end
