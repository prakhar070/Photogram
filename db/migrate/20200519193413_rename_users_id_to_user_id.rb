class RenameUsersIdToUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :users_id, :user_id
    rename_column :likes, :posts_id, :post_id
  end
end
