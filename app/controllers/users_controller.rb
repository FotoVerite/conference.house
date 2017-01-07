class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You are nearly done. We are sending an email to validate your email address. Please wait 30 seconds.'
      redirect_to login_path
    else
      render('new')
    end
  end

  def edit
    current_user
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = 'You have successfully updated your account.'
      redirect_to account_path
    else
      render('edit')
    end
  end

  # <tt>validate</tt> is used to verify that a user has access to the
  # email address they provided. Their email is their proof of identity.
  # A user will click the link in an email which will include an
  # authentication_token. In this action, we look up the token and
  # enable the user account.
  def authenticate
    @user = User.where(:email_validation_token => params[:token]).first
    if @user
      @user.email_validation_token = nil
      @user.enabled = true
      @user.save
      login_member(@user)
      render('authenticate_success')
    else
      render('authenticate_failed')
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        :password,
        :password_confirmation,
        :username
      )
    end

end