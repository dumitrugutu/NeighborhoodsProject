require 'rails_helper'

describe ServiceArea do
  context 'Validations' do
    it { should validate_presence_of(:group_id) }
    it { should validate_presence_of(:neighborhood_id) }
  end
  
  context 'Associations' do
    it { should belong_to(:group) }
    it { should belong_to(:neighborhood) }
  end
end