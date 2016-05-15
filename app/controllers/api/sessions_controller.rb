class Api::SessionsController < Api::CorsController
  include ActionController::MimeResponds
  include ActionController::Cookies
  include ActionController::ImplicitRender
  before_action :set_user, only: [:create, :destroy]
  
  skip_before_filter :verify_authenticity_token
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    puts params
    @user = user_email.present? && User.find_by(email: user_email)

    if @user and @user.valid_password? user_password
      puts user_password
      sign_in :user, @user
      @user.generate_authentication_token!
      @user.save
      render json: @user, status: 200, location: [:api, @user]
    else
      render json: { errors: "Invalid email or password", password: params[:session] }, status: 422
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
  
  private
  
    def set_user
      @user = User.all
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end

end
