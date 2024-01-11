# spec/views/splash.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :view do
  it 'displays the "Log In" and "Sign up" buttons' do
    render
 
    expect(rendered).to have_selector('.splash.text-white.bg-main-color h1', text: 'Budget App')
    expect(rendered).to have_link('Log In', href: new_user_session_path)
    expect(rendered).to have_link('Sign up', href: new_user_registration_path)
  end
end
