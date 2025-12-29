# frozen_string_literal: true

module IframeSupport
  extend ActiveSupport::Concern

  included do
    skip_before_action :verify_authenticity_token, if: :iframe_request?
  end

  private

  def iframe_request?
    request.headers['X-Requested-With'] == 'iframe' ||
      request.referrer&.include?('localhost:5173') ||
      request.referrer&.include?('127.0.0.1:5173') ||
      request.referrer&.include?('docuseal-railway-production-2b66.up.railway.app')
  end
end
