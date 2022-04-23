class UsersBackoffice::UsersController < UsersBackofficeController
  before_action :set_user

  def search_for_user
    if params[:user]
      @users = User._search_user(params[:user]).order(fullname: :asc).page(params[:page])
    else
      @users = User.all.order(fullname: :asc).page(params[:page])
    end
  end

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
    params.require(:user).permit(:fullname, :email)
  end
  
end
