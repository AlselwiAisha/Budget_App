require 'rails_helper'

RSpec.describe 'Caregories home Page', type: :feature do
  let(:user) { User.create(name: 'aisha', email: 'aisha@example.com', password: 'password') }
  before(:each) do
    @category = Category.create(
      id: 1,
      user_id: user.id,
      name: 'Sport',
      icon: 'icon'
    )
    @transactions = [
      Transact.create(
        author_id: user.id,
        name: 'transaction 1',
        amount: 200
      ),
      Transact.create(
        author_id: user.id,
        name: 'transaction 2',
        amount: 200
      )
    ]
    TransactCategory.create(transact_id: @transactions[0].id, category_id: @category.id)
    TransactCategory.create(transact_id: @transactions[1].id, category_id: @category.id)

    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit category_transacts_path(category_id: @category.id)
  end

  describe 'Transaction page' do
    it 'Shows the title in header' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'displays the category name' do
      expect(page).to have_content(@category.name)
    end

    it 'displays the  icon' do
      expect(page).to have_content(@category.icon)
    end

    it 'shows the total transaction for this category' do
      expect(page).to have_content(400)
    end

    it 'shows the all transaction' do
      expect(page).to have_content('transaction 1')
      expect(page).to have_content('200')
      expect(page).to have_content('transaction 2')
      expect(page).to have_content('200')
    end

    it 'shows the add transaction button' do
      expect(page).to have_link('Add a new Transaction')
    end

    it 'navigates to the new category page when clicking "Add a new Transaction"' do
      click_on 'Add a new Transaction'
      expect(page).to have_content('NEW TRANSACTION')
    end
  end
end
