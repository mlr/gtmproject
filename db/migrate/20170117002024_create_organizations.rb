class CreateOrganizations < ActiveRecord::Migration[5.0]
  def up
    create_table :organizations do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :organizations, :name, unique: true
    add_index :organizations, :slug, unique: true
  end

  def down
    drop_table :organizations
  end
end
