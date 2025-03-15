class SessionsController < ApplicationController
  def new
    render "new"
  end

  def create
    @user = User.find_by({ "email" => params["email"] })

    if @user && @user.authenticate(params["password"])  # BCrypt authentication
      session["user_id"] = @user["id"]
      flash[:notice] = "Login successful!"
      redirect_to "/places"
    else
      flash[:alert] = "Invalid email or password. Try again."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to "/login"
  end
end
