class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :introduction, :text
    add_column :users, :hobby, :text
  end
end
