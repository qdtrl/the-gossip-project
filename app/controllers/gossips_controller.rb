class GossipsController < ApplicationController
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
    gossip = Gossip.create(post_params, )
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
     
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end
end
