class UsersController < ApplicationController

  

  def index
    @users = User.all
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
  end

  # def edit
  #   @user = User.find(params[:id])
  # end





  # private

  # def user_params
  #   params.require(:user).permit(:email, :image, :description)
  # end
end



