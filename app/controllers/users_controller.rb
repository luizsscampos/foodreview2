# User Controller for viewing user account
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
