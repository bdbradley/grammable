class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#can add methods here that comments and grams controller can use
  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end
end
