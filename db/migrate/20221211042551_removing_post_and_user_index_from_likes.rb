class RemovingPostAndUserIndexFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :user, index: true
    remove_reference :likes, :post, index: true
  end
end
