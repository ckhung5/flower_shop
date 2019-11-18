require "json"

module JsonParser
	def self.data
		file = File.open "input.json"
		JSON.load file
	end
end