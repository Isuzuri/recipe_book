class UsersController < ApplicationController
  skip_before_action :authorized, only: [ :create, :login ]

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
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, token: @token }, status: :accepted
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
