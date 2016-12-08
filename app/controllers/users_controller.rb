class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params) #create new user with params in private method
    if @user.save #return true or false
      redirect_to users_path #save user and redirect to all users
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
