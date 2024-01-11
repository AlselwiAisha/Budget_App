# spec/views/transacts/index.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'transacts/index.html.erb', type: :view do
  before do
    category = Category.create(id: 1, name: 'Category Name', icon: 'category-icon')
    assign(:category, category)

    @transacts = [
      Transact.create(
        name: 'transaction 1',
        amount: 200,
        created_at: Time.now
      ),
      Transact.create(
        name: 'transaction 2',
        amount: 200,
        created_at: Time.now
      ),
      Transact.create(
        name: 'transaction 3',
        amount: 200,
        created_at: Time.now
      )
    ]
    assign(:transacts, @transacts)
    assign(:total, 1234.56)
  end

  it 'renders the transactions view' do
    render

    expect(rendered).to have_selector('.new-btn a.link', text: 'Add a new Transaction')
    expect(rendered).to have_selector('.categ-trans .tran-name.text-color', text: 'Category Name')
    expect(rendered).to have_selector('.categ-trans .text-main-color', text: '$1,234.56')

    @transacts.each do |tran|
      expect(rendered).to have_selector('.list svg') # SVG element
      expect(rendered).to have_selector('.list .tran-name.text-color span', text: tran.name)
      expect(rendered).to have_selector('.list .date-span', text: tran.created_at&.strftime("%d %B '%Y, %R"))
      expect(rendered).to have_selector('.list .text-main-color', text: "$#{number_with_delimiter(tran.amount)}")
    end
  end
end
