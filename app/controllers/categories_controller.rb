class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end

  def home
    @categories = current_user.categories
  end

  def new
    @category = Category.new
    @choices = [
      ['🛒'], ['🍽️'],
      ['⚽'], ['📐'],
      ['🚗'], ['🛋️'],
      ['🍔'], ['⚕️'],
      ['🎮'], ['💻'],
      ['🌿'], ['🎨'],
      ['💼'], ['📱']
    ]
  end

  def create
    @user = current_user
    @category = @user.categories.new(categories_params)
    @category.user = @user
    if @category.save
      redirect_to home_categories_path, notice: 'Category was successfully created'
    else
      redirect_to new_category_path, alert: 'Can\'t create a new category'
    end
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon).merge(user: current_user)
  end
end
