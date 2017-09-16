class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :lname
      t.string :fname
      t.string :email
      t.string :birth
      t.string :pwd

      t.timestamps null: false
    end
  end
end
