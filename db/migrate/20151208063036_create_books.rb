class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.date :published_at
      t.integer :issue
      t.string :isbn
      t.string :find_at

      t.timestamps null: false
    end
  end
end
