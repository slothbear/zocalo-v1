class AddLegaciesToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :directory_update, :text
    add_column :members, :email_list, :text
  end
end
