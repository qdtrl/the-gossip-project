class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.create(post_params)
    redirect_to gossip_path(gossip.id)
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      redirect_to gossips_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  
  def post_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end
end
