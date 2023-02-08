class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def index 
        render json: User.all
    end

    def show
        render json: @current_user
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def update
        user = @current_user
        user.update!(params.permit(:email, :username))
        render json: user
        / double check update of old password logic after front end is developed /
        if user.authenticate(params.permit(:old_password))
            user.update!(params.permit(:password, :password_confirmation))
            render json: user
        else 
            render json: {error: "Incorrect old password"}, status: :not_found
        end
    end

    def destroy
        @current_user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:email, :username, :password, :password_confirmation)
    end
end
