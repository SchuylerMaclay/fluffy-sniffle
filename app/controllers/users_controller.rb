class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = set_user
    @followship = Followship.where(
    follower_id: current_user.id,
    followed_id: @user.id).first_or_initialize if current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = set_user
    redirect_to user_path(@user), notice: 'You can only edit yourself' unless current_user == @user
  end

  def update
    @user = set_user
    if @user = current_user
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      render :edit, notice: "you kant edit someone else"
    end
  end

  def destroy
    @user = set_user
    if @user = current_user
      @user.qweets.destroy_all
      if @user.destroy
        session[:user_id] = nil
        redirect_to users_path, notice: 'User was successfully DESTROYED.'
      else
        render :edit
      end
    else
      render :edit, notice: "you kant kill someone else"
    end
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)

    end
end
