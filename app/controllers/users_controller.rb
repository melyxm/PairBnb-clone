class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end

  def index
       @user = User.order(:id).page params[:page]
  end

end
