class FollowshipsController < ApplicationController


  def create

    @followship = Followship.new
    @followship.followed_id = params[:followed_id]
    @followship.follower_id = current_user.id

    if @followship.save
      redirect_to User.find(params[:followed_id])
    else
      flash[:error] = "Couldn't Follow"
      redirect_to root_url
    end
  end

  def destroy
    @followship = Followship.find(params[:followship_id])
    @followship.destroy
    redirect_to user_path(params[:id])
  end
end


# current_user.find_followship_id_by_user(@user)
