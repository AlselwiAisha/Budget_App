# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'aisha', email: 'aisha@example.com', password: 'password') }

  before do
    @category = Category.new(
      user: @user,
      name: 'bas',
      icon: 'icon'
    )
  end

  describe 'validations' do
    it 'Is not valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'Is not valid without a measurement unit' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end
end
