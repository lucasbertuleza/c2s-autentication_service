# Responsável pelo encode e decode de tokens JWT
#
class JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

  # @param payload [Hash]
  # @param exp [ActiveSupport::TimeWithZone] data de expiração
  #
  # @return [String]
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # @param token [String]
  #
  # @return [Hash]
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    ActiveSupport::HashWithIndifferentAccess.new decoded
  end
end
