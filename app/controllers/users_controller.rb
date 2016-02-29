class UsersController < ApplicationController
  before_action :authenticate_user!
  
  layout "user_layout"
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def create
  end

  def destroy
  	
  end
end
