class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def show
    @users = User.all
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
