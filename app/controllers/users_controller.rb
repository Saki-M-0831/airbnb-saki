class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @accommodations = @user.accommodations
  end
end
