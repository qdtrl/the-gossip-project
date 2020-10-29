class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @users = @city.users
    @gossips = Gossip.where(user: @users)
  end
end
