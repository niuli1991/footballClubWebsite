class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #skip_before_filter :verify_authenticity_token, :only => [:index]
  protect_from_forgery :except => :recevice_guest
  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        guest_user(with_retry = false).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user if with_retry
  end

  def hello
  	render text: "hello, world"
  end

  protected
  	def after_sign_in_path_for(resource)
  		users_path
  	end

    def after_sign_out_path_for(resource)
      new_user_session_path
    end

  private
  	def create_guest_user
	    u = User.create(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
	    u.save!(:validate => false)
	    session[:guest_user_id] = u.id
	    u
	end

	def logging_in
		
	end
end
