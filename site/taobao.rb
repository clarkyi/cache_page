#encoding: utf-8

module CatchPage
  module Taobao
    extend Basic
    PRICE_AREA_HTML_TAG_ID = "div.tb-property-cont strong#J_StrPrice em.tb-rmb-num"
    TITLE_AREA_HTML_TAG_ID = "div#J_Title h3.tb-main-title"
    IMAGE_AREA_HTML_TAG_ID = "li div.tb-pic a img"
    REGULAR_MATCH_IMAGE = /\.(jpg|png|gif)_(\d.)x(\d.)./

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
          doc.collect{|response|"<img src='#{get_large_img(response.attributes['data-src'].value,REGULAR_MATCH_IMAGE)}' />"}
        end.join
      }
    end
  end  
end
