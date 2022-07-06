class CreateForuns < ActiveRecord::Migration[7.0]
  def change
    create_table :foruns do |t|
      t.string :nome
      t.string :topico
      t.integer :id_owner

      t.timestamps
    end
  end
end
