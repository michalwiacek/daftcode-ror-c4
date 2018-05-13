class User < ApplicationRecord
  include Talkable

  has_many :posts
  
  validates :name, presence: true
  validates :token, presence: true, uniqueness: true
  
  after_initialize :generate_token!

  private
  
  def generate_token!
    self.token = SecureRandom.hex
  end
end
