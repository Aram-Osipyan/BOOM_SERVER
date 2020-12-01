class Player < ApplicationRecord
  has_secure_password
  validates :name, :presence => true, uniqueness: { case_sensitive: true }

  def to_token_payload
    {
        sub: id,
        class: self.class.to_s
    }
  end

  def self.from_token_request(request)
    name = request.params&.[]('auth')&.[]('name')
    find_by name: name
  end

  def self.from_token_payload(payload)
    find(payload['sub']) if payload['sub'] && payload['class'] && payload['class'] == to_s
  end
end
