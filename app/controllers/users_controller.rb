class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    # render json: @users
  end

  def show
  end

  def update
    @user.update!(user_params)
  end

  def destroy
    @user.destroy!
  end

  def create
    User.create!(user_params)
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:account, :name, :email)
    end
end
