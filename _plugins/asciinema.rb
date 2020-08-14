# coding: utf-8
# Jekyll Asciinema - The lazy way to embed Asciinema in Jekyll

module Jekyll
  class Asciinema_player < Liquid::Tag
    @id = nil

    PLAY_ID = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ PLAY_ID
        @id = $1
      end
    end

    def render(context)
      source = "<center>"
      source += "<script type=\"text/javascript\" src=\"https://asciinema.org/a/#{@id}.js\" id=\"asciicast-#{@id}\" async></script>"
      source += "</center>"
      source
    end
  end

  class Asciinema_image < Liquid::Tag
    @id = nil

    IMG_ID = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ IMG_ID
        @id = $1
      end
    end

    def render(context)
      source = "<a href=\"https://asciinema.org/a/#{@id}\" target=\"_blank\"><img src=\"https://asciinema.org/a/#{@id}.png\"></a>"
      source
    end
  end
  
end

Liquid::Template.register_tag('asciinema_play', Jekyll::Asciinema_player)
Liquid::Template.register_tag('asciinema_img', Jekyll::Asciinema_image)
