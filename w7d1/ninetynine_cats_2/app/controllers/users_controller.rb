class UsersController < ApplicationController

    before_action :require_logged_in, only: [ :index, :show ]
    before_action :require_logged_out, only: [ :new ]

    def new
        @user = User.new

        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to cats_url
        else
            render :new
        end
    end

    private

    def user_params
        # .permit - based on the form
        params.require(:user).permit(:username, :password)
    end
end
