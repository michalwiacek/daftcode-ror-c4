class InitialPostGenerator
  attr_reader :user_id, :description, :error, :id

  def initialize (params)
    @params = params.merge!(description: 'siema')
    @id = params.fetch(:user_id)
  end

  def call
    puts @params
    if User.find_by_id(@id).posts.count.zero?
      @post = Post.create(@params)
      @error = !@post.persisted?
      self
    else
      puts "user has some posts"
    end
  end
end