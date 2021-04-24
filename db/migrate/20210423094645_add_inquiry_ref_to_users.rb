class AddInquiryRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :inquiries, :user, foreign_key: true, null: false
  end
end
