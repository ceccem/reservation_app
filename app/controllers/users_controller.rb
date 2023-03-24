class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :profile, :update]
    def index
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

    def profile
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(params.require(:user).permit(:image, :name, :introduction))
            flash[:notice] = "更新しました"
            redirect_to "/users/#{current_user.id}/show"
        else
            flash[:notice] = "登録に失敗しました"
            render "profile"
        end
    end



end
