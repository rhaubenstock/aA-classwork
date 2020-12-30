require "byebug"
class UsersController < ApplicationController
    def index
        #debugger
        # if params has a :query key -> search for that user
        if params.keys.length > 2
            key = params.keys.reject {|k| k == "controller" || k == "action"}.first
            users = User.where('username LIKE ?', "%#{params[key]}%")
        else
            # otherwise -> return all users
            users = User.all
        end
        render json: users
    end
  
    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end