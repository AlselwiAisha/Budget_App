# spec/models/transact_category_spec.rb
require 'rails_helper'

RSpec.describe TransactCategory, type: :model do
  let(:user) { User.create(name: 'aisha', email: 'aisha@example.com', password: 'password') }

  before do
    @category = Category.new(
      name: 'bas',
      icon: 'icon'
    )

    @transact =
      Transact.create(
        name: 'transaction 1',
        amount: 200
      )
  end

  it 'is not valid without a transact_id' do
    transact_category = TransactCategory.new(
      category_id: @category
    )
    expect(transact_category).to_not be_valid
  end

  it 'is not valid without a category_id' do
    transact_category = TransactCategory.new(
      transact_id: @transact
    )
    expect(transact_category).to_not be_valid
  end
end
