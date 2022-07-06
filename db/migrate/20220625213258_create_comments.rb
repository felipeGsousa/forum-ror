class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.datetime :commentdate
      t.string :username
      t.integer :id_owner
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
