class NutriSpider < Kimurai::Base
  # @name = "github_spider"
  # @engine = :selenium_chrome
  # @config = {
  #   user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
  #   before_request: { delay: 4..7 }
  # }

  # def self.process(url)
  #   @start_urls = [url]
  #   self.crawl!
  # end

  # def parse(response, url:, data: {})
  #   return response
  # end
  @name = 'vehicles_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response
  end
end
