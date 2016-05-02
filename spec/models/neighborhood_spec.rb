require 'rails_helper'

describe Neighborhood do
  context 'Validations' do
    it { should validate_presence_of(:name) }
  end
  
  context 'Associations' do
    it { should have_many(:service_areas) }
    
    it { should have_many(:groups).through(:service_areas) }
  end
end