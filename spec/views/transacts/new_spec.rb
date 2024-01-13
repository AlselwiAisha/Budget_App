# spec/views/transacts/new.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'transacts/new.html.erb', type: :view do
  let(:category) { Category.create(id: 1, name: 'Category Name', icon: 'category-icon') }
  let(:transact) do
    Transact.create(
      name: 'transaction 3',
      amount: 200,
      created_at: Time.now
    )
  end
  before do
    assign(:category, category)

    assign(:transact, transact)
    TransactCategory.create(transact_id: transact.id, category_id: category.id)
    render
  end

  it 'renders the new transaction form' do
    expect(rendered).to have_selector('div.main-field input[type="text"][name="transact[name]"][required="required"]')
    expect(rendered).to have_selector('input[type="submit"][value="Save"].save-btn')
  end
end
