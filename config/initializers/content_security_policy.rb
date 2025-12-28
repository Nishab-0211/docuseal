# frozen_string_literal: true

Rails.application.config.content_security_policy do |policy|
  policy.frame_ancestors :self, '*'
end

Rails.application.config.content_security_policy_nonce_generator = ->(request) { SecureRandom.base64(16) }
Rails.application.config.content_security_policy_nonce_directives = %w[script-src]
