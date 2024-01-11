# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  before :each do
    @user = User.new(name: 'Aisha', email: 'aisha@mail.com', password: '654321')
  end

  it 'validates name is there' do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it 'validates email is there' do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  context 'association' do
    it 'has many categories' do
      temp = User.reflect_on_association(:categories)
      expect(temp.macro).to eq(:has_many)
    end

    it 'has many transactions' do
      temp = User.reflect_on_association(:transacts)
      expect(temp.macro).to eq(:has_many)
    end
  end
end
