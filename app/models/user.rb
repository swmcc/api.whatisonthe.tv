require 'jwt'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_jwt
    payload = { id: id, exp: 60.days.from_now.to_i }
    JWT.encode(payload, Rails.application.secret_key_base)
  end
  
  def self.decode_jwt(token)
    decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' })
    User.find(decoded_token[0]["id"])
  end
end

