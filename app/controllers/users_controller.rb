class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Bienvenue #{@user.first_name} !"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Votre profil a été modifié avec succès"
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
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end