class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |author_params|
      author_params.permit(:username, :email)
    end
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
