class ApplicationController < ActionController::API
  protected

  def render_resource_not_found
    head :not_found
  end
end
