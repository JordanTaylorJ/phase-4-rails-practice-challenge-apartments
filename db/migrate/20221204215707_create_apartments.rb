class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.integer :number
      t.integer :tenant_id
      t.integer :lease_id
      t.timestamps
    end
  end
end
