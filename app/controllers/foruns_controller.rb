class ForunsController < ApplicationController
  before_action :set_forun, only: %i[ show edit update destroy ]
  @var = false

  # GET /foruns or /foruns.json
  def index
    @foruns = Forun.all
    @posts = Post.all
  end

  # GET /foruns/1 or /foruns/1.json
  def show
    @forun = Forun.find(params[:id])
    verify_user
  end

  def verify_user
    @forun = Forun.find(params[:id])
    @usr_frns = UserForun.all
    @usr_frns.each do |usr_frn|
      if usr_frn.user == Current.user && usr_frn.forun == @forun
        @var = true
      end
    end
  end

  # GET /foruns/new
  def new
    @forun = Forun.new
  end

  # GET /foruns/1/edit
  def edit
  end


  # POST /foruns or /foruns.json
  def create
    @forun = Forun.new(forun_params)
    @forun.id_owner = Current.user.id
    Current.user.foruns.push(@forun)
    respond_to do |format|
      if @forun.save
        format.html { redirect_to forun_url(@forun), notice: "Forun was successfully created." }
        format.json { render :show, status: :created, location: @forun }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foruns/1 or /foruns/1.json
  def update
    respond_to do |format|
      if @forun.update(forun_params)
        format.html { redirect_to forun_url(@forun), notice: "Forun was successfully updated." }
        format.json { render :show, status: :ok, location: @forun }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foruns/1 or /foruns/1.json
  def destroy
    @forun.posts.each do |post|
      post.destroy
    end
    @forun.destroy

    respond_to do |format|
      format.html { redirect_to foruns_url, notice: "Forun was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forun
      @forun = Forun.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forun_params
      params.require(:forun).permit(:nome, :topico, :id_owner)
    end
end

