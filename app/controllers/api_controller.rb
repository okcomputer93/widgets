class ApiController < ApplicationController
  before_action :authenticate
  before_action :require_json

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.find_by(key: token, deactivated_at: nil).present?
    end
  end

  def require_json
    unless request.format.json?
      head 406
    end
  end
end
