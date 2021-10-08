# frozen_string_literal: true
require "csv"

class ImportTaipeiComapnies < ActiveRecord::Migration[6.1]
  def up
    csv = CSV.table(Rails.root + 'tmsind.csv', liberal_parsing: true)
    csv.each do |row|
      company = Company.new(
        id: row[:""],
        name: row[:__companyname1],
        branch_name: row[:__companyname2],
        telephone: row[:__tel],
        address: row[:__address1],
        email: row[:__email],
        business_hours: row[:__businesshours],
        charges: row[:__charges],
        main_type: row[:__sporttype],
        sub_type: row[:__sporttype1],
        company_no: row[:__companyno],
        lat_lng: row[:__latlng]
      )

      company.main_type = "" if company.main_type == "null"

      unless company.save
        puts "Data error, cannot save #{company.inspect}"
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
