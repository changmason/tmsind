require 'rails_helper'

RSpec.describe Company, type: :model do
  let!(:company) { FactoryBot.create(:company) }

  context 'validations' do
    it { should validate_presence_of(:name).on(:update) }

    it 'should validate format of email' do
      company.email = 'invalid@email_address'
      expect(company).not_to be_valid
      expect(company.errors[:email]).to eq(['is invalid'])
    end
  end
end
