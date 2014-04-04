class CreatingOwners < ActiveRecord::Migration
  def change
    create_table(:owners) do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :email,      null: false
      t.string :company
     end

     add_index :owners, :first_name
     add_index :owners, :last_name
  end
end
