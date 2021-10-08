require 'rails_helper'

RSpec.describe Company, type: :model do
  let!(:company) { FactoryBot.create(:company) }

  context 'validations' do
    it { should validate_presence_of(:name).on(:update) }
  end
end
