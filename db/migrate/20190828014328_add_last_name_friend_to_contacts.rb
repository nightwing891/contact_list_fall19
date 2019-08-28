class AddLastNameFriendToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :last_name, :string
    add_column :contacts, :friend, :boolean
  end
end
