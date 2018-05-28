class SessionsController < ApplicationController
  def new
  end

  def create

    # Verifies user existance and password
    if user = User.authenticate_with_credentials(params[:email], params[:password])

      # Save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If login is invalid, redirect to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

