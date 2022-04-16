class UsersBackoffice::UsersController < UsersBackofficeController
  before_action :set_user

  def timeline
  end

  def update
    if @user.update(user_params)
      redirect_to users_backoffice_timeline_path, notice: 'User was successfully updated'
    else
      redirect_to users_backoffice_timeline_path, alert: @user.errors
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.permit(:fullname, :email)
  end
  
end
