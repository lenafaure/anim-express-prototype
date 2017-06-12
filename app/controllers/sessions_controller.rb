class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Vous êtes maintenant connecté"
      redirect_to animators_path
    else
      flash.now[:danger] = "Erreur dans votre login ou mot de passe"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Vous êtes maintenant deconnecté"
    redirect_to root_path
  end

end