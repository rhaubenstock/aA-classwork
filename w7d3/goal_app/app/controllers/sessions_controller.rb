class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user
            login!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = ["Invalid username or password"]
            render :new
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
        redirect_to new_session_url
    end
end
