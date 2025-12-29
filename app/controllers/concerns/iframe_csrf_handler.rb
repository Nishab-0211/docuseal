module IframeCsrfHandler
  extend ActiveSupport::Concern

  included do
    skip_before_action :verify_authenticity_token, if: :iframe_request?
  end

  private

  def iframe_request?
    # Check if request is from iframe context
    request.headers['Sec-Fetch-Dest'] == 'iframe' ||
    request.headers['Sec-Fetch-Mode'] == 'navigate' ||
    request.referrer&.include?('localhost:5173') ||
    request.headers['Origin']&.include?('localhost:5173')
  end
end
