class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:session][:username])
        if @user and @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to root_url
        else
            flash.now[:error] = "Invalid email/password combination "
            redirect_to new_session_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end
