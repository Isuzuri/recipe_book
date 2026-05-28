class UsersController < ApplicationController
  skip_before_action :authorized, only: [ :create, :login, :refresh ]

  def create
    @user = User.new(user_params)
    
    if @user.save
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, token: @token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      @access_token = encode_token(user_id: @user.id)
      @refresh_token = generate_refresh_token(@user)
      render json: { user: @user, access_token: @access_token, refresh_token: @refresh_token }, status: :accepted
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def refresh
    @refresh_token = RefreshToken.find_by(token: params[:refresh_token])
    if @refresh_token && @refresh_token.expires_at > Time.current
      @user = @refresh_token.user
      @access_token = encode_token(user_id: @user.id)
      render json: {access_token: @access_token}
    else
      render json: {error: 'Token expired'}, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
