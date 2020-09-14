class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string "os_type", null: false
      t.string "store_url", null: false
      t.timestamps
    end
  end
end
