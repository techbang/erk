# modified from https://github.com/deduce/octopress-authorbox
require 'digest/md5'
module Jekyll
  require_relative 'post_filters'
  class PostAuthorBox < PostFilter

    def initialize(config)
      base_path = File.expand_path(File.join(config['source'], "../"))
      @authors = YAML::load(File.open(File.join(base_path, "author.yml")))
      @template = Liquid::Template.parse(File.read(File.join(base_path, "source/_layouts/author.html")))
    end

    def post_render(post)
      if post.is_post?
        author = @authors[post.data["author"]]
        if author
          post.content << render_author(author)
        end
      end
    end

    def render_author(author)
      return @template.render( 'author' => author, 'gravatar' => gravatar_url(author['email']))
    end

    def gravatar_url(email)
      hash = Digest::MD5.hexdigest(email.downcase)
      return "http://www.gravatar.com/avatar/#{hash}"  
    end
  end

end