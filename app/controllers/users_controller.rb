class UsersController < ApplicationController
  before_filter :authorize_admin, only: :create

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created."
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :action=>'new'
    end
  end

  def show
    @family = Family.find_by_id params[:id]
    @teacher = Teacher.find_by_id params[:id]
    render :show
  end

  private

  # This should probably be abstracted to ApplicationController
  # as shown by diego.greyrobot
  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def user_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation, :type)
  end
end
