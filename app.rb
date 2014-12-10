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
      @client.update("hoge")
      'Hello'
    end

    get '/upload' do
      'Use POST method.'
    end

    post '/upload' do
      if @params[:bearer] == @bearer
        @message = @params[:message]
        @temp_file_name = @params[:media][:tempfile]
        @client.update_with_media(@message, File.new(@temp_file_name))
        erb :result
      end
    end
  end
end
