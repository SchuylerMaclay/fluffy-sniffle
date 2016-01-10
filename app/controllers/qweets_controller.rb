class QweetsController < ApplicationController
  # before_action :set_qweet, only: [:show, :edit, :update, :destroy]

  def show
    @qweet = set_qweet
  end

  def create
    @qweet = Qweet.new
    @user = User.find(params[:user_id])
    if @qweet.update(content: qweet_params[:content], user_id: params[:user_id])
      redirect_to [@user, @qweet], notice: 'Qweet was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @qweet = set_qweet
    @user = User.find(@qweet.user)
  end

  def update
    @qweet = set_qweet
    @user = User.find(@qweet.user)
    if @qweet.update(qweet_params)
      redirect_to [@user, @qweet], notice: 'Qweet was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @qweet.destroy
  end

  def index
    @qweets = Qweet.all
  end

  def new
    @qweet = Qweet.new
    @user = User.find(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qweet
      @qweet = Qweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qweet_params
      params.require(:qweet).permit(:content, :user_id)

    end
end
