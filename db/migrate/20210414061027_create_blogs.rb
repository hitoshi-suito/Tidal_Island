class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content, null: false
      t.text :image
      t.references :user, foreign_key: true
      t.references :tide, foreign_key: true

      t.timestamps
    end
  end
end
