require "sinatra"
require "twitter"

module TwitterGateway
  class App < Sinatra::Application

    before do
      @bearer = ENV['BEARER']
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
        config.access_token = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
      end
    end

    get '/' do
      'Hello'
    end

    get '/upload' do
      'Use POST method.'
    end

    post '/upload' do
      http_headers = request.env.select { |k, v| k.start_with?('HTTP_') }
      logger.info "#{http_headers}"
    end
  end
end
