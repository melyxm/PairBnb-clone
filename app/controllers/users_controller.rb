class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end
end
