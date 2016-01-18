class AddUsedidToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :user_id, :integer
  end
end
