require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, FactoryBot.create(:company))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@company.id.to_s)
    expect(rendered).to match(@company.name)
    expect(rendered).to match(@company.branch_name)
    expect(rendered).to match(Regexp.quote(@company.telephone))
    expect(rendered).to match(@company.address)
    expect(rendered).to match(@company.email)
    expect(rendered).to match(@company.business_hours)
    expect(rendered).to match(@company.charges)
    expect(rendered).to match(CGI::escapeHTML(@company.main_type))
    expect(rendered).to match(CGI::escapeHTML(@company.sub_type))
    expect(rendered).to match(@company.company_no)
    expect(rendered).to match(@company.lat_lng)
  end
end
