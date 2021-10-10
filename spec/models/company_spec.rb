require 'rails_helper'

RSpec.describe Company, type: :model do
  let!(:company) { FactoryBot.create(:company) }

  context 'validations' do
    it { should validate_presence_of(:name).on(:update) }
    it { should validate_presence_of(:main_type).on(:update) }
    it { should validate_presence_of(:sub_type).on(:update) }
  end
end
