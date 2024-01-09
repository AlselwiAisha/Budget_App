class TransactsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transacts = @category.transacts.order(created_at: :desc)
    @total = @transacts.map(&:amount).sum
  end

  def new
    @transact = Transact.new
    @category = Category.find(params[:category_id])
  end

  def create
    @user=current_user
    @category = Category.find(params[:category_id])
    @transact = @user.transacts.new(transacts_params)
    if @transact.save
      TransactCategory.create(category_id: @category.id, transact_id: @transact.id)
      redirect_to category_transacts_path(category_id: @category.id),
                  notice: 'Transaction was successfully created.'
    else
      redirect_to new_category_transact_path(category_id: @category.id), alert: 'Transaction can\'t be created'
    end
  end

  private

  def transacts_params
    params.require(:transact).permit(:name, :amount)
  end
end
