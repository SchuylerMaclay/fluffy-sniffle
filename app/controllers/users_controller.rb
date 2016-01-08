class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = set_user
  end

  def create
    @user = User.create(user_params)
    redirect_to @user, notice: 'User was successfully created.'
  end

  def edit
    @user = set_user
  end

  def update
    @user = set_user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # def destroy
  #   @user.destroy
  # end

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
