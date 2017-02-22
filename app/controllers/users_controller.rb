class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
    @lisitngs = @user.listings
  end
end
