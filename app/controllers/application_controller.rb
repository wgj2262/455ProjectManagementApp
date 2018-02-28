class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_tenant!
  ##    milia defines a default max_tenants, invalid_tenant exception handling
  ##    but you can override these if you wish to handle directly
  rescue_from ::Milia::Control::MaxTenantExceeded, :with => :max_tenants
  rescue_from ::Milia::Control::InvalidTenantAccess, :with => :invalid_tenant

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
