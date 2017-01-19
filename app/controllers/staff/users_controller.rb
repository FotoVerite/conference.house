class Staff::UsersController < StaffController

  def index
    @users = User.page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was successfully created."
      redirect_to staff_admins_path
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  # standard edit action
  # also updates @admin.permissons.
  def update
    @user = User.find(params[:id])
    # Only values that are in protected_controllers are valid
    if @user.update_attributes(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to staff_users_path
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User was successfully deleted."
    redirect_to staff_users_path
  end

  private

  def user_params
    params.require(:user).permit(
      "email",
      "first_name",
      "last_name",
      "password",
      "username",
      "previous_password",
      "email_confirmation",
      "password_confirmation"
    )
  end

end
