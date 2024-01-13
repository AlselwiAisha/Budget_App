class TransactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Category.find(params[:category_id])
    @transacts = @category.transacts.order(created_at: :desc)
    @total = @transacts.map(&:amount).sum
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = Category.all
    @transact = Transact.build
  end

  def create
    @user = current_user
    @transact = @user.transacts.build(transacts_params)
    @category = Category.find(params[:category_id])

    if @transact.save
      category_ids = params[:transact][:category_ids] || @category
      category_ids.each do |category_id|
        TransactCategory.create(category_id:, transact_id: @transact.id)
      end
      redirect_to category_transacts_path(category_id: @category),
                  notice: 'Transaction was successfully created.'
    else
      @category = Category.find(params[:category_id])
      @categories = Category.all
      render :new, alert: 'Transaction can\'t be created'
    end
  end

  private

  def transacts_params
    params.require(:transact).permit(:name, :amount, category_ids: [])
  end
end
