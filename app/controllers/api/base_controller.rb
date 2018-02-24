module Api
  class BaseController < ActionController::Base
    # before_action :authenticate_request, except: %I[
    #   register login
    # ]
    attr_reader :current_user

    private

    def authenticate_request
      render json: { error: 'Not Authorized' }, status: 401 unless current_user
    end

    def current_user
      @current_user ||=
        if params[:user_authentication_token]
          AuthorizeApiRequest.call(
            'Authorization' => "Base #{params[:user_authentication_token]}"
          ).result
        elsif (auth_token = cookies['user-authentication-token'])
          AuthorizeApiRequest
            .call('Authorization' => "Base #{auth_token}").result
        else
          AuthorizeApiRequest.call(request.headers).result
        end
    end
  end
end
