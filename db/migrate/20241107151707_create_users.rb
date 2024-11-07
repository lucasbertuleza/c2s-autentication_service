class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, limit: 510, null: false, index: {unique: true}
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
