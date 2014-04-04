class Building < ActiveRecord::Migration
  def change
    create_table(:buildings) do |t|
      t.string :street_address,           null: false
      t.string :city,                     null: false
      t.string :state,                    null: false, limit: 2
      t.string :postal_code,              null: false
      t.text   :description
    end

    add_index :buildings,  :street_address
    add_index :buildings,  :postal_code
  end
end
