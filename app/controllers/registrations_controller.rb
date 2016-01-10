class RegistrationsController < ApplicationController
  def new
  end

  def create
    form_fields = params.permit(:name,:username, :password, :password_confirmation)
    @user = User.new(form_fields)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up"
    else
      render :new
    end
  end
end
