#encoding: utf-8

module CachePage
  module Site
    module Amazon
      extend Basic   
      PRICE_AREA_HTML_TAG_ID = "priceblock_ourprice"
      TITLE_AREA_HTML_TAG_ID = "div.a-section h1#title span#productTitle"
      IMAGE_AREA_HTML_TAG_ID = "altImages"
      
    end
  end  
end