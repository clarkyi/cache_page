#encoding: utf-8
require 'mechanize'

module CatchPage
  module Basic
    extend self
    def html_doc url
      mech = Mechanize.new
      mech.get(url)
    end

    def price(tag,url=nil)
      lab_price = @doc.root.css(tag).first.content.gsub(",","")
      lab_price.gsub("￥","")
    end

    def images(tag)
      yield(@doc.root.css(tag))
    end

    def title tag
      @doc.root.css(tag).first.content.strip
    end

    def get_large_img img_url,tag
      img_url.gsub(tag,".")
    end
  end
end
