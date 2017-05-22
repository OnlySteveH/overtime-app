class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index

  end
  # the 'new' action does not do anything
  # aside from rendering the new form
  # It does not create it in the database
  def new
    # An ActiveRecord form is going
    # to need to have this post.
    @post = Post.new
  end

  def create
    # require is bringing in the post model.
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def show
  end

  private

  def post_params
    # for security reasons, permit is going to whitelist the parameter
    # to only take in these parameters of :date and :rationale so we
    # don't allow any SQL Injection.
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
