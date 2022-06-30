class Nurses < ActiveRecord::Migration[6.1]
  def change
    create_table :nurses do |t|
      t.string :email
      t.string :name
      t.integer :age
      t.string :sex
      t.integer :doctor_id
      t.string :password_digest
      t.timestamps
    end
  end
end
