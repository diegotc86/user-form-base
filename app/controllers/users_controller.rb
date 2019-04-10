class UsersController < ApplicationController
  def index
    @user = User.last
  end

  def new
    @errors = "Show me the errors dude!"
    @user = User.new
  end

  def create
    @user = User.create(params[:user_params])

    if @user.valid?
      @user.save
      redirect_to "/users/new", status: 301
    else
      errors = @user.errors.full_messages
      redirect_to "/users/new", status: 301, flash: { errors: errors}
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

  # def valitadate_last_name(my_last_name)
  #   temporal = my_last_name.downcase.split(' ')
  #   temporal.each_with_index do |c|
  #     if c.length >= 3
  #       if c.[0.1] != "d"
  #         c.capitalize!
  #       end
  #     end
  #   end
  #   temporal.join(' ')
end
