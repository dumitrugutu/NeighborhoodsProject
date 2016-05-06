require 'rails_helper'

RSpec.describe GroupRep, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:group_id) }

    it { should allow_value('email@address.foo').for(:email) }
    it { should_not allow_value('email_address.foo').for(:email) }
  end

  context 'Associations' do
    it { should belong_to(:group) }
    it { should have_many(:events).with_foreign_key(:group_rep_id) }
  end

end
