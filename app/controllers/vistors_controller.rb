class VistorsController < ApplicationController
  def index
  	@announcement = Announcement.order(created_at: :desc).first!
  	@match = Match.order(created_at: :desc).first!
  	
  end
end
