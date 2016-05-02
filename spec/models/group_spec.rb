require 'rails_helper'

describe Group do
  context 'Validations' do
    it { should validate_presence_of(:name) }
  end
  
  context 'Associations' do
    it { should have_many(:service_areas) }
    it { should have_many(:neighborhoods).through(:service_areas) }
    it { should have_many(:group_reps).with_foreign_key('group_id') }
  end
end