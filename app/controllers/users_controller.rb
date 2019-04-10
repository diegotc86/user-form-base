class UsersController < ApplicationController
  def index
    @user = User.last
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.create(params[:user])
    @user = User.create(first_name: params[:user][:first_name])
    @user = User.create(last_name: params[:user][:last_name])
    @user = User.create(username: params[:user][:username])
    @user = User.create(email: params[:user][:email])
    @user = User.create(password: params[:user][:password])
    @user = User.create(password_hint: params[:user][:password_hint])
    
    if @user.save
      redirect_to :action => 'index'
    else
      render :new 
    end
    
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :email_confirmation,
      :password,
      :password_confirmation,
      :password_hint
    )
  end
end
