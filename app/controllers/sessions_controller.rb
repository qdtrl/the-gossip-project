class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id#.to_s
      flash[:success] = "Connexion réussie !"
      redirect_to root_path

    else
      flash[:failure] = 'Combinaison mail/mot de passe incorrect'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Déconnecté!"
  end
end
