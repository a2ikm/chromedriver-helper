require 'nokogiri'
require 'open-uri'
require 'version_sorter'

module Chromedriver
  class Helper
    class GoogleCodeParser
      BUCKET_URL = 'http://chromedriver.storage.googleapis.com'

      attr_reader :source, :platform

      def initialize(platform, open_uri_provider=OpenURI)
        @platform = platform
        @source = open_uri_provider.open_uri(BUCKET_URL)
      end

      def downloads
        doc = Nokogiri::XML.parse(source)
        items = doc.css("Contents Key").collect {|k| k.text }
        items.reject! {|k| !(/chromedriver_#{platform}/===k) }
        items.map {|k| "#{BUCKET_URL}/#{k}"}
      end

      def newest_download
        VersionSorter.sort(downloads).last
      end
    end
  end
end
