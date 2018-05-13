class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :token, null: false
      t.timestamps
      t.index :token, unique: true
    end
  end
end
