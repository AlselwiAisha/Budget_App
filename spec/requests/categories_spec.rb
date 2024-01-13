require 'rails_helper'

RSpec.describe 'Caregories home Page', type: :feature do
  before(:each) do
    @user = User.create(
      id: 3,
      name: 'Aisha',
      email: 'aisha@gmail.com',
      password: '123456'
    )

    @categories = [
      Category.create(
        id: 1,
        user_id: @user.id,
        name: 'Sport',
        icon: 'icon'
      ),
      Category.create(
        id: 2,
        user_id: @user.id,
        name: 'Cars',
        icon: 'icon'
      )
    ]
    visit new_user_session_path # Assuming this is your sign-in page
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    visit home_categories_path
  end

  describe 'Home page' do
    it 'displays the categories names' do
      @categories.each do |category|
        expect(page).to have_content(category.name)
      end
    end

    it 'displays the categories icons' do
      @categories.each do |category|
        expect(page).to have_content(category.icon)
      end
    end
  end
end
