class AddStatusToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :status, :string
  end
end
