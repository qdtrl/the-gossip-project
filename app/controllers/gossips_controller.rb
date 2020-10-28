class GossipsController < ApplicationController
  def index
    @gossip = Gossip.find(params[:id])
  end

  def show
    @gossips = Gossip.all
  end

  def new
    @gossip = Category.new
  end

  def create
    @gossip = Gossip.create(post_params)
    redirect_to gossip_path(gossip.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end
end
