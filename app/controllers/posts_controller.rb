class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  @var = false
  

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @foruns = Forun.all 
    verify_user
  end

  def verify_user
    puts @post.forun_id
    @forun = Forun.find(@post.forun_id)
    @usr_frns = UserForun.all
    @usr_frns.each do |usr_frn|
      if usr_frn.user == Current.user && usr_frn.forun == @forun
        @var = true
      end
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @forun = Forun.find(params[:forun_id])
    @post = @forun.posts.create(params[:post].permit(:title, :body).merge(postdate:DateTime.now, username:Current.user.name, id_owner:Current.user.id))
    redirect_to post_path(@post) 
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    
    @forun = Forun.find(params[:forun_id])
    @post = @forun.posts.find(params[:id])
    @post.destroy
    redirect_to forun_path(@forun)

    
    ##@post.destroy
    ##respond_to do |format|
    ##  format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    ##  format.json { head :no_content }
    ##end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :postdate)
    end
end
