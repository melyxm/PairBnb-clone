class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
    @listings = @user.listings
    @new_listing = Listing.new
  end

  def index
    @user = User.order(:id).page params[:page]
  end

end
