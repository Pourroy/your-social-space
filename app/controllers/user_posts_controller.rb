class UserPostsController < ApplicationController
  before_action :authenticate_user!, only: %i[ show edit update destroy ]
  before_action :set_user_post, only: %i[ show edit update destroy ]

  # GET /user_posts or /user_posts.json
  def index
    @user_posts = UserPost.all
  end

  # GET /user_posts/1 or /user_posts/1.json
  def show
  end

  # GET /user_posts/new
  def new
    @user_post = UserPost.new
  end

  # GET /user_posts/1/edit
  def edit
  end

  # POST /user_posts or /user_posts.json
  def create
    @user_post = UserPost.new(user_post_params)

    respond_to do |format|
      if @user_post.save
        format.html { redirect_to @user_post, notice: "User post was successfully created." }
        format.json { render :show, status: :created, location: @user_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_posts/1 or /user_posts/1.json
  def update
    respond_to do |format|
      if @user_post.update(user_post_params)
        format.html { redirect_to @user_post, notice: "User post was successfully updated." }
        format.json { render :show, status: :ok, location: @user_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_posts/1 or /user_posts/1.json
  def destroy
    @user_post.destroy!

    respond_to do |format|
      format.html { redirect_to user_posts_path, status: :see_other, notice: "User post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_post
      @user_post = UserPost.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_post_params
      params.expect(user_post: [ :content ])
    end
end
