class UsersController < ApplicationController
  def new
    render "new"
  end

  def create
    @user = User.new
    @user["first_name"] = params["first_name"]
    @user["last_name"] = params["last_name"]
    @user["email"] = params["email"]
    @user["username"] = params["username"]
    @user["password"] = params["password"]  # BCrypt automatically hashes this

    if @user.save
      flash[:notice] = "Thanks for signing up! Please log in."
      redirect_to "/login"
    else
      flash[:alert] = "Error signing up. Try again."
      render "new"
    end
  end
end
