class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :branch_name
      t.string :telephone
      t.string :address
      t.string :email
      t.string :business_hours
      t.string :charges
      t.string :main_type
      t.string :sub_type
      t.string :company_no
      t.string :lat_lng

      t.timestamps
    end
  end
end
