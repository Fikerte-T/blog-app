require_relative '20220407202646_create_join_table_user_post'
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    revert CreateJoinTableUserPost
    create_table :likes, &:timestamps
  end
end
