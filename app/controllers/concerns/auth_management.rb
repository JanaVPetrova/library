module Concerns
  module AuthManagement
    def sign_in user
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def signed_in?
      !session[:user_id].nil?
    end

    def current_user
      if signed_in?
        User.find session[:user_id]
      else
        nil
      end
    end

    def authenticate_user!
      unless signed_in?
        redirect_to new_session_path
      end
    end
  end
end
