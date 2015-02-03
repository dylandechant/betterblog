class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @users = User.new
    render :new
  end

  def create
    
    @user = User.new(post_params) #post_params?
    binding.pry
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { @user.to_json }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_post
      @user = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:user).permit(:username, :password, :user_id)
    end
end
