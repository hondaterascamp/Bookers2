class ApplicationController < ActionController::Base
  include Authentication

  helper_method :current_user
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  private

  def current_user
    Current.user
  end

  def after_authentication_url
    books_path
  end

  def after_logout_url
    root_path
  end
end
