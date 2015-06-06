# Require custom libraries
require 'lib/wordpress'

# Do not compile template files used when dynamically generating pages
ignore 'templates/*'

# Create a new instance of WordPress. Replace the URL with the URL of your
# rest server endpoint.
wordpress = WordPress.new('http://middleman-wordpress-example.dev/wp-json')

# Dynamically generate pages using wordpress data
wordpress.posts.each do |post|
  proxy "/blog/#{post['slug']}/index.html", "templates/post.html", locals: { post: post }
end

# Make the WordPress instance available to templates via a helper
helpers do
  def wp
    wordpress
  end
end

# Create a pageable set of posts
activate :pagination do
  pageable_set :posts do
    wordpress.posts
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # Minify on build
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
