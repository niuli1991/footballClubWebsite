class UsersController < ApplicationController
  layout "user_layout"
  def index
  	@users = User.all
  end

  def create
  end

  def destroy
  	
  end
end
