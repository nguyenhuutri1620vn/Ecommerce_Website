class ErrorsController < ApplicationController
  layout 'frontend'

  def not_found
    render status: 404
  end

  def interal_server_error
    render status: 500
  end

  def authentication_error
    render status: 403
  end
end
