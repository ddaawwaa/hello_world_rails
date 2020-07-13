class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    binding.pry
    @user = User.find(params[:id])
    @user.update!(user_params)
  end


  private
    def user_params
      params.require(:user).permit(:account, :name, :email)
    end
end
