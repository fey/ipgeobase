# frozen_string_literal: true

require "happymapper"

module Ipgeobase
  class IpMetaData
    include HappyMapper

    tag "query"
      element :country, String, deep: true
      element :countryCode, String, deep: true
      element :region, String, deep: true
      element :regionName, String, deep: true
      element :city, String, deep: true
      element :lat, Float, deep: true
      element :lon, Float, deep: true
  end
end
