class UsersController < ApplicationController
    def index
        @users = User.all
        @rooms = Room.all
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

    def profile
        @user = current_user
    end



end
