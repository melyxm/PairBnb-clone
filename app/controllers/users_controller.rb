class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    byebug
  end

  private

  def user_params
    params[:user].permit(:email, :password, :image)
  end

end
