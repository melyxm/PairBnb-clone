class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
    @new_listing = Listing.new
  end

end
