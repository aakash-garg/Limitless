class UpdatePostsChangeTitleColumn < ActiveRecord::Migration
  def change
    change_column :posts, :title, :text, limit: 60000 # or whatever
    change_column :posts, :body, :text, limit: 60000 # or whatever

  end
end
