require "sinatra"
require "twitter"
require "yaml"

module TwitterGateway
  class App < Sinatra::Application

    before do
      yml = YAML.load_file('config.yml')
      config = yml['oauth']
      @bearer = yml['bearer']
      @client = Twitter::REST::Client.new(config)
    end


    post '/' do
      if @params[:bearer] == @bearer
        @message = @params[:message]
        @temp_file_name = @params[:media][:tempfile]
        @client.update_with_media(@message, File.new(@temp_file_name))
        erb :result
      end
    end
  end
end
