class GroceryListsController < ApplicationController
  
  before_filter :authorize

  def create
    @user =  User.find(session[:user_id])
    @user.grocery_list = Grocery_lists.create
  end

  def show
    @user = User.find(session[:user_id])
    @grocery_list = @user.grocery_list
  end

  def grocery_lists_params
    params.require(:grocery_lists).permit(:items)
  end

  private :grocery_lists_params
end