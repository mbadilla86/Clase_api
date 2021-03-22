class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false 
      t.text :content
      t.string :image
      t.string :author
      t.integer :status, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
