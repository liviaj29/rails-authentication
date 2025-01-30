class RegistrationsController < ApplicationController
    # Instantiates a new User and assigns to a @user instance variable so that it can be accessed in the view
    def new
      @user = User.new
    end
    # Instantiates a new User with the parameters submitted
    def create
      @user = User.new(user_params)
    # If the parameters are valid then save and redirect to dashboard
      if @user.save
        sign_in @user
        redirect_to dashboard_path, notice: "You have successfully registered!"
    # Otherwise try again
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password)
    end
end