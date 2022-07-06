class CreateUserForuns < ActiveRecord::Migration[7.0]
  def change
    create_table :user_foruns do |t|
      t.references :user, null: false, foreign_key: true
      t.references :forun, null: false, foreign_key: true

      t.timestamps
    end
  end
end
