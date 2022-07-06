class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.date :postdate
      t.string :username
      t.integer :id_owner
      t.references :forun, null: false, foreign_key: true

      t.timestamps
    end
  end
end
