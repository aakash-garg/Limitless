class UpdateCommentsChangeContentColumn < ActiveRecord::Migration
  def change
    change_column :comments, :content, :text, limit: 60000 # or whatever
  end
end
