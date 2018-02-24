module Api
  class UsersController < BaseController
    def register
      user = User.new(user_params)
      if user.save
        render json: {
          result: 'successful'
        }
      else
        render json: {
          result: 'failed'
        }
      end
    end

    def login
      user = User.find_by_email(params[:user][:email])
        if user.present? && user.valid_password?(params[:user][:password])
          sign_in(user)
          render json: {
            result: 'successful'
          }
        else
          render json: {
            result: 'failed'
          }
        end
    end

    private

    def user_params
      params.require(:user).permit(
        :full_name,
        :email,
        :password
      )
    end
  end
end
