# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  protected

  def layout_by_resource
    'authentication' if devise_controller?
  end

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name birthdate])
    elsif resource_class == Company
      devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name])
    end
  end
end
