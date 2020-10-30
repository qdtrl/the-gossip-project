class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:index, :show]
  def create
    comment = Comment.create(post_params)
    redirect_to comment_path(comment.id)
  end

  def destroy
    @comment = Gossip.find(params[:id])
    @comment.destroy
    redirect_to gossips_path
  end

  def new
    @comment = Comment.new
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end
end
