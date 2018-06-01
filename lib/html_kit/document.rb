# frozen_string_literal: true

require 'nokogiri'
require 'net/http'
require 'uri'

require_relative './errors'

module HtmlKit
  ##
  # === HtmlKit::Document
  #
  # Used for parsing urls which are `http` or `https`
  # You can use this to validate a html document. This uses nokogiri internally.
  # Warning: Currently doesn't support HTML5 tags
  #
  # For example (from irb):
  #
  #  irb(main):001:0> require 'html_kit'
  #  => true
  #  irb(main):002:0> doc = HtmlKit::Document.new('http://www.nokogiri.org/index.html')
  #  => #<HtmlKit::Document:0x007fbb5408cfe8 @url="http://www.nokogiri.org/index.html">
  #  irb(main):003:0> doc.valid?
  #  => false
  ##
  class Document
    def initialize(url)
      @url = url.strip

      raise HtmlKit::Errors::InvalidUrlError unless supported_scheme?
    end

    def valid?
      errors.empty?
    end

    def errors
      document.errors
    end

    def html5?
      document.internal_subset.html5_dtd?
    end

    private

    def supported_scheme?
      !(@url =~ /^https:|^http:/).nil?
    end

    def document
      Nokogiri::HTML(html_content)
    end

    def html_content
      Net::HTTP.get(URI.parse(@url))
    end
  end
end
