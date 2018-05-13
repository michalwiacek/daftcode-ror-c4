class Post < ApplicationRecord
  belongs_to :user
  before_create :set_name

  include Talkable

  def set_name
   self.name = user.name
  end
end