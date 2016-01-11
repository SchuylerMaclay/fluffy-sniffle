class QweetsController < ApplicationController
  # before_action :set_qweet, only: [:show, :edit, :update, :destroy]

  def show
    @qweet = set_qweet
  end

  def create
    @qweet = Qweet.new
    @user = User.find(params[:user_id])
    if @user = current_user
      if @qweet.update(content: qweet_params[:content], user_id: params[:user_id])
        redirect_to [@user, @qweet], notice: 'Qweet was successfully created.'
      else
        render action: 'new'
      end
    else
      render :edit, notice: "you may not qweet on someone elses behalf"
    end
  end

  def edit
    @qweet = set_qweet
    @user = User.find(@qweet.user)
    redirect_to user_path(@user), notice: 'You can only edit your own Qweets' unless current_user == @user
  end

  def update
    @qweet = set_qweet
    @user = User.find(@qweet.user)
    if @user = current_user
      if @qweet.update(qweet_params)
        redirect_to [@user, @qweet], notice: 'Qweet was successfully updated.'
      else
        render action: 'edit'
      end
    else
      render :edit, notice: "you kant kill someone elses qweets"
    end
  end

  def destroy
    @qweet = set_qweet
    @user = User.find(params[:user_id])
    if @user = current_user
      if @qweet.destroy
        redirect_to user_path(@user), notice: 'Qweet was successfully DESTROYED.'
      else
        render :edit
      end
    else
      render :edit, notice: "you kant kill someone elses qweets"
    end
  end

  def index
    @qweets = Qweet.all
  end

  def new
    @user = User.find(params[:user_id])
    if current_user == @user
      @qweet = Qweet.new
    else
      redirect_to user_path(@user), notice: 'You can only compose your own Qweets'
    end
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
