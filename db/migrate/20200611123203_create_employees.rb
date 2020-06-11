class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.string :department
      t.string :emp_id
      t.string :account_no
      t.string :pan_no
      t.string :pf_no
      t.references :company
      t.timestamps
    end
  end
end
