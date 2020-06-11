class CreatePayrols < ActiveRecord::Migration[5.2]
  def change
    create_table :payrols do |t|
      t.string :month
      t.references :company
      t.timestamps
    end
  end
end
