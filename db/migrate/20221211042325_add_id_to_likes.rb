class AddIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column    :likes, :id, :primary_key
    add_column    :likes, :created_at,  :datetime, null: false
    add_column    :likes, :updated_at, :datetime, null: false
  end
end
