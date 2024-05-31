# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  before_action :set_locale

  def update_locale
    new_locale = params[:locale]
    session[:locale] = new_locale
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('form_auth', partial: 'layouts/shared/form_auth')
      end
    end
  end

  private

  def set_locale
    I18n.locale = (session[:locale] || 'pt-BR')
  end

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
