#encoding: utf-8

module CatchPage
  module Jd
    extend Basic
    PRICE_AREA_HTML_TAG_ID = "li#summary-price div.dd strong#jd-price"
    TITLE_AREA_HTML_TAG_ID = "div#product-intro div#name h1"
    IMAGE_AREA_HTML_TAG_ID = "div.spec-items ul.lh li img"
    REGULAR_MATCH_IMAGE = "n1"
    def self.get_page_info url
      @doc = html_doc url
      merge_info url
    end

    def self.price(tag, url=nil)
      url = get_ajax_price_url url
      doc = html_doc url
      JSON.parse(doc.content).first['p']
    end

    private
    def self.merge_info url
      { purchase_link: url,
        title: title(TITLE_AREA_HTML_TAG_ID), 
        price: price(PRICE_AREA_HTML_TAG_ID,url), 
        content: images(IMAGE_AREA_HTML_TAG_ID) do |doc|
          doc.collect{|response|"<img src='#{get_large_img(response.attributes['src'].value,REGULAR_MATCH_IMAGE)}'/>"}
        end.join
      }
    end

    def self.get_ajax_price_url url
      sku = url.match(/(\d.*)\.html/)[1]
      "http://p.3.cn/prices/get?skuid=J_#{sku}"
    end

    def self.get_large_img img_url,tag
      img_url.gsub("n5",tag)
    end
  end
end
