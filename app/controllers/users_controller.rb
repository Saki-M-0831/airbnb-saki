class UsersController < ApplicationController
  skip_before_action :require_login

  def show
    @user = User.find(params[:id])
    @accommodations = @user.accommodations
  end
end
