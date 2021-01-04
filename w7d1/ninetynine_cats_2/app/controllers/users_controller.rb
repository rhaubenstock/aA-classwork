class UsersController < ApplicationController

    def new
        @user = User.new

        render :new
    end

    def create
        @user = User.create(user_params)

        if user.save
            # login(@user)
            redirect_to user_url(@user)
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
