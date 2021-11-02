require "uri"
require "open-uri"
require "addressable"
require_relative "ipgeobase/version"
require "net/http"
module Ipgeobase
  URL = "http://ip-api.com/xml"
  autoload "IpMetaData", "ipgeobase/ip_meta_data"

  def self.lookup(ip)
      template = Addressable::Template.new("#{URL}{/ip}")
    uri = template.expand ip: ip
    response = Net::HTTP.get_response(uri)
    IpMetaData.parse(response.body)
  end
end
