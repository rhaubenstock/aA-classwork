class SessionsController < ApplicationController

    before_action :require_logged_out, only: [ :new ]

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username], 
            params[:user][:password])

        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        # logout
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
        redirect_to new_session_url
    end
end
