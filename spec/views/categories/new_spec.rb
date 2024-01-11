# spec/views/categories/new.html.erb_spec.rb
require 'rails_helper'

RSpec.describe 'categories/new.html.erb', type: :view do
  before do
    assign(:header, 'NEW CATEGORY')
    assign(:category, Category.new)
    assign(:choices, ['icon1', 'icon2', 'icon3']) # Replace with your actual choices
    render
  end

  it 'renders the form for creating a new category' do
    expect(rendered).to have_selector('form[action="/categories"][method="post"]') do |form|
      expect(form).to have_selector('input[name="category[name]"][placeholder="New Category"][required]')
      expect(form).to have_selector('select[name="category[icon]"]')
      expect(form).to have_selector('input[type="submit"][value="Save"].save-btn')
    end
  end
end
