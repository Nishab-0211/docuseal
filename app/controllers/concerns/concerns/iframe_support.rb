# frozen_string_literal: true

module IframeSupport
  extend ActiveSupport::Concern

  included do
    skip_before_action :verify_authenticity_token, if: :iframe_request?
  end

  private

  def iframe_request?
    request.headers['X-Requested-With'] == 'iframe' ||
      request.referrer&.include?('localhost:5173')
  end
end
