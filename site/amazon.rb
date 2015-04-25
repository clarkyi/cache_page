#encoding: utf-8

module CatchPage
  module Amazon
    extend Basic
    PRICE_AREA_HTML_TAG_ID = "span#priceblock_ourprice"
    TITLE_AREA_HTML_TAG_ID = "div.a-section h1#title span#productTitle"
    IMAGE_AREA_HTML_TAG_ID = "span.a-button-inner span.a-button-text img"
    REGULAR_MATCH_IMAGE = /\._.*_\./
    
    def self.get_page_info url
      @doc = html_doc url
      merge_info url
    end
    private
    def self.merge_info url
      { purchase_link: url,
        title: title(TITLE_AREA_HTML_TAG_ID), 
        price: price(PRICE_AREA_HTML_TAG_ID), 
        content: images(IMAGE_AREA_HTML_TAG_ID) do |doc|
          doc.collect{|response|"<img src='#{get_large_img(response.attributes['src'].value,REGULAR_MATCH_IMAGE)}'/>"}
        end.join
      }
    end
  end
end
