class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = set_user
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
  end

  def update
    @user = set_user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = set_user
    @user.qweets.destroy_all

    if @user.destroy
      redirect_to users_path, notice: 'User was successfully DESTROYED.'
    else
      render :edit
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

# <%= link_to 'Ad details', [@magazine, @ad] %>
# <%= link_to 'Edit Ad', [:edit, @magazine, @ad] %>
# get 'photos/:id', to: 'photos#show'
# rake routes
# Rails.application.config.session_store :cookie_store, key: '_your_app_session', domain: ".example.com"
