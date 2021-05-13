# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < TestCase
  def setup
    @ip = "8.8.8.8"
    @stub = stub_request(:get, "#{Ipgeobase::URL}/#{@ip}")
            .with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" })
            .to_return(status: 200, body: load_fixture("response.xml"), headers: {})
  end

  def test_lookup_http_query
    Ipgeobase.lookup @ip

    assert_requested @stub
  end

  def test_lookup_response_object
    meta = Ipgeobase.lookup @ip

    assert_equal 39.03, meta.lat
    assert_equal(-77.5, meta.lon)
    assert_equal "United States", meta.country
    assert_equal "Ashburn", meta.city
  end
end
