require "bundler/setup"
require "open-uri"
Bundler.require(:default, :development)

require_relative "../lib/cli.rb"
require_relative "../lib/restaurant.rb"
require_relative "../lib/scraper.rb"