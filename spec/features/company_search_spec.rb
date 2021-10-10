require "rails_helper"

RSpec.feature "Company search", :type => :feature do
  let!(:company1) { FactoryBot.create(:company) }
  let!(:company2) { FactoryBot.create(:company) }

  before { visit companies_url }

  scenario 'without any specified condition' do
    expect(page).to have_css("table tr td", text: company1.name)
    expect(page).to have_css("table tr td", text: company2.name)
  end

  scenario 'by name with "LIKE" condition' do
    partial_name = company1.name[1..-2]
    within("#search-form") { fill_in 'Name', with: partial_name }
    click_button 'Search'
    expect(page).to have_css("table tr td a", text: company1.id)
    expect(page).not_to have_css("table tr td a", text: company2.id)
  end

  scenario 'by telephone with "equal" condition' do
    within("#search-form") { fill_in 'Telephone', with: company1.telephone }
    click_button 'Search'
    expect(page).to have_css("table tr td", text: company1.telephone)
    expect(page).not_to have_css("table tr td", text: company2.telephone)
  end

  scenario 'by address with "LIKE" condition' do
    partial_address = company1.address[1..-2]
    within("#search-form") { fill_in 'Address', with: partial_address }
    click_button 'Search'
    expect(page).to have_css("table tr td", text: company1.address)
    expect(page).not_to have_css("table tr td", text: company2.address)
  end

  scenario 'by email with "equal" condition' do
    within("#search-form") { fill_in 'Email', with: company1.email }
    click_button 'Search'
    expect(page).to have_css("table tr td", text: company1.email)
    expect(page).not_to have_css("table tr td", text: company2.email)
  end

  scenario 'by main_type with "equal" condition' do
    within("#search-form") { select(company1.main_type, from: 'main_type') }
    click_button 'Search'
    expect(page).to have_css("table tr td", text: company1.email)
    expect(page).not_to have_css("table tr td", text: company2.email)
  end

  scenario 'by sub_type with "IN" condition' do
    within("#search-form") do
      select(company1.sub_type, from: 'sub_type')
      select(company2.sub_type, from: 'sub_type')
    end
    click_button 'Search'
    expect(page).to have_css("table tr td", text: company1.email)
    expect(page).to have_css("table tr td", text: company2.email)
  end

  scenario 'by company_no with "equal" condition' do
    within("#search-form") { fill_in 'Company no', with: company1.company_no }
    click_button 'Search'
    expect(page).to have_css("table tr td", text: company1.company_no)
    expect(page).not_to have_css("table tr td", text: company2.company_no)
  end
end