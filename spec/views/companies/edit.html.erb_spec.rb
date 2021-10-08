require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, FactoryBot.create(:company))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

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
