class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :occupation
      t.string :specialization
      t.string :phone_number
      t.integer :age
      t.integer :years_of_commitment
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
