
class UsersController < Clearance::UsersController
  before_action :require_login, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
        UserNotifierMailer.send_signup_email(@user).deliver
        redirect_to(@user, :notice => 'User created')
      else
        redirect_to root_url
      end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert] = "Something when wrong. Please try again."
      render :edit
    end
  end


  private

  def check_authorization
    unless current_user.id == params[:id].to_i #integer must be equals to integer
      redirect_to "/"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params[:user].permit(:user_name, :full_name, :email, :password, :image)
  end
end
