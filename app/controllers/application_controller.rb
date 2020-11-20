class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  def render_resource_not_found
    head :not_found
  end
end
