class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #
  # def user_not_authorized
  #   respond_to do |format|
  #     format.html{ render file: "#{Rails.root}/public/422", layout: false, status: :forbidden }
  #     format.any { head :forbidden }
  #   end
  #
  # end
end
