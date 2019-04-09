class UsersController < ApplicationController
  def index
    @user = User.last
  end

  def new
    @user = User.new
  end
  # If there is an error in a field, redirect the user back to the form and display the error at the beginning.
  # If the user was created successfully, redirect the user to the index action.
  def create
    @user = User.new(user_params)
    if @user.save
      redirect to :index
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
