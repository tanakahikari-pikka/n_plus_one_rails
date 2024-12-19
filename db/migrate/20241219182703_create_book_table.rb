class CreateBookTable < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :books do |t|
      t.string :title, null: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
