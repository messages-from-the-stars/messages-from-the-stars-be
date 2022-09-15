require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'relationships' do
    it { should have_many :user_messages }
    it { should have_many(:messages).through(:user_messages)}
  end

end