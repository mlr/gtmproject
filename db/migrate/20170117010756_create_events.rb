class CreateEvents < ActiveRecord::Migration[5.0]
  def up
    create_table :events do |t|
      t.references :organization
      t.string :message
      t.string :hostname
      t.timestamp :timestamp

      t.timestamps
    end

    add_foreign_key :events, :organizations, on_delete: :cascade
  end

  def down
    drop_table :events
  end
end
