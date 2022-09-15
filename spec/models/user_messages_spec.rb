require 'rails_helper'

RSpec.describe UserMessage, type: :model do

  describe 'validations' do
    it { should define_enum_for(:user_role).with([:author, :reader]) }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :message }
  end

end