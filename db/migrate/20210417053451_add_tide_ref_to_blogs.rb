class AddTideRefToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :tide, foreign_key: true
  end
end
