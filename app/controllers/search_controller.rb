class SearchController < ApplicationController
	before_action :authenticate_user!
	def search_match
  		respond_to do |format|
  			@search = Match.where("kick_of_time > ? and kick_of_time < ? and match_type = ?", params[:search_match][:start].to_date.to_time, params[:search_match][:end].to_date.to_time, params[:search_match][:match_type]).order(created_at: :desc).paginate(page: params[:page],per_page:10)
  			if @search
  				format.js
  			else
  				
  			end
  		end
  	end

  	def search_news
  		respond_to do |format|
  			@search = News.where("created_at > ? and created_at < ? and news_type = ?", params[:search_news][:start].to_date.to_time, params[:search_news][:end].to_date.to_time, params[:search_news][:news_type]).order(created_at: :desc).paginate(page: params[:page],per_page:10)
  			if @search
  				format.js
  			else

  			end
  		end
  	end

  	def search_announcement
  		respond_to do |format|
  			@search = Announcement.where("created_at > ? and created_at < ? and annou_type = ?", params[:search_announcement][:start].to_date.to_time, params[:search_announcement][:end].to_date.to_time, params[:search_announcement][:annou_type]).order(created_at: :desc).paginate(page: params[:page],per_page:10)
  			if @search
  				format.js
  			else
  				
  			end
  		end
  	end

end
