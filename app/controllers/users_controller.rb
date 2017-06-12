class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Anim Express #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def show
  end

  private
   def set_user
     @user = User.find(params[:id])
   end
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end