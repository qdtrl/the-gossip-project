class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @city = City.find(@user.city_id)
    @gossips = User.find(@user.id).gossips
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
