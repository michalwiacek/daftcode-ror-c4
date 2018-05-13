module Talkable
  extend ActiveSupport::Concern

  included do
    def self.talk
     "Hi #{self.name} class"
    end
  end

  def talk
    "#{self.class.name} instance can talk!"
  end
end