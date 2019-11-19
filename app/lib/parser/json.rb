# frozen_string_literal: true

require 'json'

module JsonParser
  def self.data
    file = File.open 'input.json'
    JSON.load file
  end
end
