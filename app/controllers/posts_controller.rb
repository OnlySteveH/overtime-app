class PostsController < ApplicationController
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
    # for security reasons, permit is going to whitelist the parameter
    # to only take in these parameters of :date and :rationale so we
    # don't allow any SQL Injection.
    @post = Post.new(params.require(:post).permit(:date, :rationale))

    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end
end
