class AddUsernameToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :user_name, :string
    add_column :activities, :type_content, :integer
  end
end
