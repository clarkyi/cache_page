#encoding: utf-8
require 'nokogiri'

module CachePage
  module Site
    module Basic
      PRICE_AREA_HTML_TAG_ID = ""
      IMAGE_AREA_HTML_TAG_ID = ""
      TITLE_AREA_HTML_TAG_ID = ""

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def html_doc url
          Nokogiri::HTML(open(url))
        end

        def get_price
          doc.css(PRICE_AREA_HTML_TAG_ID).each {|link|link.content}.join("")
        end

        def get_images
          doc.css(IMAGE_AREA_HTML_TAG_ID).each {|link|link.content}
        end

        def get_title
          doc.css(TITLE_AREA_HTML_TAG_ID).each {|link|link.content}.join("")
        end
      end

    end
  end  
end