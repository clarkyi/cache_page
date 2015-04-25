module CatchPage
  def self.get_page uri
    begin
      klass = uri.split(".")[1].capitalize
      merchants = CatchPage.const_get(klass)
      merchants.get_page_info uri
    rescue => e
      Rails.logger.error("get page info error:#{e}")
      {}
    end
  end
end
