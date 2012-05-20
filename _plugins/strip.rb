# Copyright (c) 2012 Aucor Oy. Released under MIT Licence
# https://github.com/aucor/jekyll-plugins

# Replaces multiple newlines and whitespace
# between them with one newline

module Jekyll
  class StripTag < Liquid::Block

    def render(context)
      super.gsub /\n\s*\n/, "\n"
    end

  end
end

Liquid::Template.register_tag('strip', Jekyll::StripTag)
