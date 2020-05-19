class UsersController < ApplicationController
    before_action :authorized, only: [:show]

    def show
        @user = User.find(params[:id])
        @posts = @user.posts.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
    end

end