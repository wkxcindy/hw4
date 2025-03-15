class UsersController < ApplicationController
  def new
    render "new"
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user.password = params["password"]

    if @user.save
      session["user_id"] = @user["id"]  # Log in the new user
      flash[:notice] = "Account created successfully!"
      redirect_to "/places"  # Redirect to places instead of login
    else
      flash[:alert] = "Error signing up. Try again."
      render "new"
    end
  end
end




