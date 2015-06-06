class WordPress
  include HTTParty

  def initialize(uri)
    self.class.base_uri uri
  end

  def posts
    @posts ||= get_posts
  end

  protected

    def get_posts
      posts = []
      page  = 1
      limit = 10

      tmp_posts = fetch_posts('post', page, limit)

      while !tmp_posts.empty?
        posts.concat tmp_posts
        page = page + 1
        tmp_posts = fetch_posts('post', page, limit)
      end

      return posts
    end

    def fetch_posts(type, page, limit)
      self.class.get("/posts?type=#{type}&page=#{page}&posts_per_page=#{limit}")
    end
end
