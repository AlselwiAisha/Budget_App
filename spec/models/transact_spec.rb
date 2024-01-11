# spec/models/transact_spec.rb
require 'rails_helper'

RSpec.describe Transact, type: :model do

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
  
  it "is not valid without an author_id" do
    @transact.author_id = nil
    expect(@transact).to_not be_valid
  end

  it "is not valid without a name" do
    @transact.name = nil
    expect(@transact).to_not be_valid
  end

  it "is not valid without an amount" do
    @transact.amount= nil
    expect(@transact).to_not be_valid
  end

  it "is not valid with a negative amount" do
    @transact.amount= -10
    expect(@transact).to_not be_valid
  end
end
