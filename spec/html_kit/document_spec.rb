# frozen_string_literal: true

require 'html_kit'

RSpec.describe HtmlKit::Document do

  it 'accepts an http or https url' do
    expect { described_class.new }.to raise_error(ArgumentError)

    expect { described_class.new('http://example.org/index.html') }.to_not raise_error
    expect { described_class.new('ftp://ftp.de.netbsd.org/') }.to raise_error(HtmlKit::Errors::InvalidUrlError)
  end

  it 'validates a simple html document' do
    subject = described_class.new('http://example.org/index.html')
    expect(subject.valid?).to be_truthy
  end
end
