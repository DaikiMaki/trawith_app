class RemoveNameFromInquiry < ActiveRecord::Migration[6.0]
  def change
    remove_column :inquiries, :name, :string
  end
end
