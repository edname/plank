class SessionsController < ApplicationController
    before_action :require_no_authentication, only: %i[new create]

    def new
    end

    def create
        user = User.find_by email: params[:email]
        if user&.authenticate(params[:password])
            sign_in user
            flash[:success] = "Welcome back, #{current_user.name_or_email}! You have successfully logged in"
            redirect_to root_path
        else
            flash[:error] = "That email or password is incorrect."
            redirect_to new_session_path
        end
    end

    def destroy
        sign_out
        flash[:success] = "You have successfully logge out"
        redirect_to root_path
    end
end