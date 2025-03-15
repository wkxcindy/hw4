class ApplicationController < ActionController::Base
  before_action :current_user  # Runs before every request
  before_action :authenticate_user, except: [:new, :create]  # Allow signup & login

  def current_user
    @current_user = User.find_by({ "id" => session["user_id"] })  # Find logged-in user
  end

  def authenticate_user
    if @current_user == nil
      flash[:alert] = "You must be logged in to view this page."
      redirect_to "/login"
    end
  end
end

