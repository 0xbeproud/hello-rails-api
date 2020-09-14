class CreateAppVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :app_versions do |t|
      t.references :app, index: true
      t.string :version, null: false
      t.string :build_code, null: false
      t.boolean :enabled, null: false
      t.integer :update_type, null: false, default: 0
      t.string :update_title, null: false
      t.string :update_description, null: false
      t.datetime :publish_at, null: false
      t.timestamps
    end
  end
end
