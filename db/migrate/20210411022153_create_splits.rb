class CreateSplits < ActiveRecord::Migration[6.0]
  def change
    create_table :splits do |t|
      t.string :name

      t.timestamps
    end
  end
end
