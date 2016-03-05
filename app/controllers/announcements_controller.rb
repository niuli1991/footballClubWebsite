class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  layout "user_layout"
  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def index
    @announcements = Announcement.order(created_at: :desc).paginate(page: params[:page],per_page:10)
  end

  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @announcement.destroy!
    respond_to do |format|
      format.html { redirect_to announcements_path, notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:annou_title, :annou_type, :content)
    end
end
