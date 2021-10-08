require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    @companies = assign(:companies, [
      FactoryBot.create(:company),
      FactoryBot.create(:company)
    ])
  end

  it "renders a list of companies" do
    render

    first_company = @companies.first
    first_company.attributes.keys.each do |attr|
      next if attr == "id"
      next if attr == "created_at"
      next if attr == "updated_at"

      value = first_company.send(attr).to_s
      value = CGI::escapeHTML(value)
      value = Regexp.quote(value)

      expect(rendered).to match(value)
    end
  end
end
