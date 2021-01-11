class SessionsController < ApplicationController

    before_action :require_logged_in, only: [:destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            @user = User.new
            @user.username = params[:user][:username]
            @user.password = params[:user][:password]
            flash.now[:errors] = ["Invalid username or password"]
            render :new
        end
    end

    def destroy
        logout

    end

end
