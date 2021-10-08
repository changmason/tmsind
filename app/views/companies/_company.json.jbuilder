json.extract! company, :id, :name, :branch_name, :telephone, :address, :email, :business_hours, :charges, :main_type, :sub_type, :company_no, :lat_lng, :created_at, :updated_at
json.url company_url(company, format: :json)
