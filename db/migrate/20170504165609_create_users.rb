class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean  "admin", default: false, null: false
      t.boolean  "email_list", default: false, null: false
      t.boolean  "home_school", default: false, null: false
      t.boolean  "subscription", default: false, null: false

      t.timestamps
    end
  end
end
