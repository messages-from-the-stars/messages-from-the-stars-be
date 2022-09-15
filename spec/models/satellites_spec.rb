require 'rails_helper'

RSpec.describe Satellite, type: :model do

  describe 'validations' do
    it { should validate_presence_of :norad_id }
    it { should validate_uniqueness_of(:norad_id) }
  end

  describe 'relationships' do
    it { should have_many :messages }
    it { should have_many :user_satellites }
  end

end