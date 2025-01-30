class SessionsController < ApplicationController
    # Display form
    def new
    end
    
    def create
    # authenticate_by: method tries to find a user in the db using email
    # if no user found then returns nil
    # if there is a user, then it hashes the password and compares with password_digest
      if user = User.authenticate_by(session_params)
        sign_in user
        redirect_to dashboard_path, notice: "Logged in with #{user.email}"
      else
        flash.now[:notice] = "Invalid email or password"
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def session_params
      params.require(:session).permit(:email, :password)
    end
end