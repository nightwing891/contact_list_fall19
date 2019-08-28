class ChangeNameToFirstName < ActiveRecord::Migration[6.0]
  def change
               # table name  old col   new_col
    rename_column :contacts, :name, :first_name
  end
end
