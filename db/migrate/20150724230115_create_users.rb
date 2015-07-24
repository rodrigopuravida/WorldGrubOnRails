class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digecd
      t.string :WorldGrubOnRails

      t.timestamps null: false
    end
  end
end
