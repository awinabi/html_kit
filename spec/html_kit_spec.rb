# frozen_string_literal: true

require 'html_kit'

RSpec.describe HtmlKit do
  it 'has a version number' do
    expect(HtmlKit::VERSION).not_to be nil
  end
end
