# frozen_string_literal: true

module JsonParser
  JSON_FILE = 'input.json'
  def self.parse
    file = File.open JSON_FILE
    JSON.load file
  end
end
