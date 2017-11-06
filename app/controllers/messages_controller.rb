require 'json'
require 'net/http'

class MessagesController < ApplicationController

  protect_from_forgery except: :api

  def new
  end
  def create
		@m=Message.new(params.require(:messages).permit(:text))
    @m.save
    url = "https://jubilant-meme.herokuapp.com/messages/" + @m.id.to_s
render plain: url
  end
  def show
		@m= Message.find(params[:id])
  end

  def api
    if request.headers["Content-Type"] == 'application/json'
      json = params.permit(:message)
  		@m = Message.new
  		@m.text = json.to_h[:message]
  		@m.save
      puts @m.text
  		url = "https://jubilant-meme.herokuapp.com/messages/" + @m.id.to_s
  		url_json = {:url => url}
      render json: url_json.to_json
    end

    if request.headers["Content-Type"] == 'text/xml'
      message_hash = Hash.from_xml(request.body.read)
      params[:message] = {"text" => message_hash["message"]}
      @m = Message.create(params.require(:message).permit(:text))
      url = {"url" => messages_url + "/" + @m.id.to_s}
      render :api
    end
  end

end
