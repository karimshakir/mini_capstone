class AddChangeDescriptonToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :text, :description
    change_column :products, :description, :text
  end
end
