class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    # this will just run db query and
    # store inside posts then make it
    # available to index action
    @posts = Post.all
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
    @post.user_id = current_user.id

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
