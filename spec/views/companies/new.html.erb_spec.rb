require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      name: "MyString",
      branch_name: "MyString",
      telephone: "MyString",
      address: "MyString",
      email: "MyString",
      business_hours: "MyString",
      charges: "MyString",
      main_type: "MyString",
      sub_type: "MyString",
      company_no: "MyString",
      lat_lng: "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[name]"

      assert_select "input[name=?]", "company[branch_name]"

      assert_select "input[name=?]", "company[telephone]"

      assert_select "input[name=?]", "company[address]"

      assert_select "input[name=?]", "company[email]"

      assert_select "input[name=?]", "company[business_hours]"

      assert_select "input[name=?]", "company[charges]"

      assert_select "input[name=?]", "company[main_type]"

      assert_select "input[name=?]", "company[sub_type]"

      assert_select "input[name=?]", "company[company_no]"

      assert_select "input[name=?]", "company[lat_lng]"
    end
  end
end
