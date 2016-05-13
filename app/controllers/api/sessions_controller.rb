class Api::SessionsController < ApplicationController
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    @user = user_email.present? && User.find_by(email: user_email)

    if @user and @user.valid_password? user_password
      sign_in :user, @user
      @user.generate_authentication_token!
      @user.save
      render json: @user, status: 200, location: [:api, @user]
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    if @user
      @user = current_user
      @user.generate_authentication_token!
      @user.save
      render json: @user, status: 204, location: [:api, @user]
    else
      head 204
    end
  end

end
