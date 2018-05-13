class UserGenerator
  attr_reader :user, :error

  def initialize (params)
    @params = params
  end

  def call
    @user = User.create(@params)
    @error = !@user.persisted?
    puts @user.id
    InitialPostGenerator.new(user_id: @user.id).call
    self
  end
end