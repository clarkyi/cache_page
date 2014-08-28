require 'cache_page/site/amazon'
require 'cache_page/site/taobao'
require 'cache_page/site/amazon'
module CachePage
  def self.get_page uri
    klass = uri.split(".")[1].capitalize.constantize
    klass.get_page_info
  end
end