# frozen_string_literal: true

# AuthenticationToken for jwt
class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'
  ALGORITHM_TYPE = 'HS256'

  # Function for encoding the jwt key
  def self.encode(user_id)
    payload = { user_id: user_id }

    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  # Function for decoding the jwt key
  def self.decode(token)
    decoded_token = JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
    decoded_token[0]['user_id']
  end
end
