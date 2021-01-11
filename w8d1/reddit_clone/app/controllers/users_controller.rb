class UsersController < ApplicationController

    before_action :require_logged_in, only: [:index, :show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
