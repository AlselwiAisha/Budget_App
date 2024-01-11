RSpec.describe 'categories/home.html.erb', type: :view do
    let(:user) do
      User.create!(id: 1,
                   name: 'Edwin',
                   email: 'edwin@mail.com',
                   password: '123456')
    end
  
    let(:categories) do
      [
        Category.create(user_id: user.id,
                        name: 'Name1',
                        icon: 'icon'),
        # Add more categories as needed
      ]
    end
  
    before do
      assign(:categories, categories)
  
      render
    end
  
    it 'renders the form' do
      categories.each do |category|
        expect(rendered).to have_link(category.name, href: category_transacts_path(category_id: category.id))
        expect(rendered).to have_content("$ #{category.transacts.sum(:amount)}")
      end
        expect(rendered).to have_link('Add a new category')
    end
  end
  