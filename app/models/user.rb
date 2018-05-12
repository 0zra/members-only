class User < ApplicationRecord
  before_create :set_remember
  has_secure_password

  has_many :posts, dependent: :destroy

  def set_remember
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end

  def remember
    set_remember
    update_attribute(:remember_token, self.remember_token)
  end
end
