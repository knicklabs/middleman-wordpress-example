# Middleman WordPress Example

An example site illustrating how to integrate WordPress managed content into a
statically generated Middleman site.

Specifically, this example illustrates how to pull posts from WordPress and
paginate them. It also illustrates how to include content from additional sources.
In this case, we create an about page from a markdown file. 

## Setup WordPress

1. Install WordPress
2. Setup pretty permalinks in the WordPress settings and update the .htaccess file
3. Download and install the [WP REST API plugin](https://wordpress.org/plugins/json-rest-api/)
4. Activate the WP REST API plugin
5. Confirm that it is working by visiting `http://www.yoursite.com/wp-json/posts?type=post`

If everything worked correctly, you will see an array of posts formatted as JSON.

## Enter Content

This example illustrates how to fetch multiple pages of content and paginate it.
For the best effect, you should enter more than 10 posts into your WordPress
installation.

## Install Middleman and Dependencies

1. cd into this project directory
2. Run `bundle install` to install all dependencies

## Configurate Middleman

1. Edit `config.rb` and update this string `http://middleman-wordpress-example.dev/wp-json`. It should point the your WordPress REST API. Do not include a trailing slash or any additional parameters.
2. Activate and configure deploy if you plan to deploy this via rsync, ftp, sftp, or git. See the [documentation](https://github.com/middleman-contrib/middleman-deploy).

## Server, Build, or Deploy

1. To build and server the site on http://localhost:4567, run `middleman server`
2. To build the site into the build directory, run `middleman build`
3. To deploy the contents of the build directory, run `middleman deploy` (only if you activated and configured deploy)
