class AddStatusToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :status, :string
  end
end
