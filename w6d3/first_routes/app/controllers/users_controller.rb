class UsersController < ApplicationController
    def index
        render plain:'index'
    end
  
    def create
        render json:params
    end


end