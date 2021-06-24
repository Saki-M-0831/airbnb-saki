class UsersController < ApplicationController
  def show
    @accommodations = current_user.accommodations
  end

  def edit

  end
end
