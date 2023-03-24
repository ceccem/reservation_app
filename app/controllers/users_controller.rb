class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :profile]
    def index
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

    def profile
        @user = current_user
    end



end
