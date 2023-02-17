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
        if params[:email].present? || params[:username].present?
            user.update!(email_or_username_params)
            render json: user
        elsif params[:password].present? && user.authenticate(params[:old_password])
            user.update!(password_params)
            render json: user
        else
            render json: { error: "Incorrect old password" }, status: :not_found
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

    def password_params
        params.permit(:password, :password_confirmation)
      end
      
      def email_or_username_params
        params.permit(:email, :username)
      end
end
