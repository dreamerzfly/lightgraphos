class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #include SessionsHelper

  #allows for strong parameters if using devise controller = https://github.com/plataformatec/devise#strong-parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #these are the permitted strong parameters, so for sign up, we will permit name to be saved
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
