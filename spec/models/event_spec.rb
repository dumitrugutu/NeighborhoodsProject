require 'rails_helper'

describe Event do
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:organizer_contact_info) }
    it { should validate_presence_of(:group_rep_id) }
    it { should validate_presence_of(:event_time) }
    # note: don't need to validate :is_free because it has a default value
    
    it 'has a valid factory' do
      expect(FactoryGirl.create(:event)).to be_valid
    end
  end
  
  context 'Associations' do
    it { should belong_to(:group_rep) }
  end
end