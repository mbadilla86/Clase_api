class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title, null: false
      t.text :content
      t.string :author
      t.boolean :active, default: true
      t.integer :status, default: 0
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
