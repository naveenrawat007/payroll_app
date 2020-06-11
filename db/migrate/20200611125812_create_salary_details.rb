class CreateSalaryDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_details do |t|
      t.bigint :working_days
      t.float :pf
      t.float :basic
      t.float :hra
      t.float :incentives
      t.float :lic
      t.float :total_earning
      t.float :pf_deduction
      t.float :esi_deduction
      t.float :pt_deduction
      t.float :tds_deduction
      t.float :total_deduction
      t.float :total_paid_amount
      t.references :employee
      t.references :payrol
      t.timestamps
    end
  end
end
