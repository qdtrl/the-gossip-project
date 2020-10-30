class UsersController < ApplicationController
  before_action :authenticate_user, only: [:create]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @city = City.find(@user.city_id)
    @gossips = User.find(@user.id).gossips
  end

  def new
    @user = User.new
    @cities = City.all
  end

  def create
    @user = User.new(params.permit(:first_name, :last_name, :email, :age, :description, :password,))
    @user.city_id = 1
    if @user.save
      flash[:success] = "Compte bien créé !"
      redirect_to root_path
    else
      flash[:failure] = "Erreur lors de la création du compte !"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
