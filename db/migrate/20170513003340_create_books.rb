class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :status
      t.boolean :have_read
      t.string :loaner_borrower

      t.timestamps
    end
  end
end
