require 'json'

class MessagesController < ApplicationController

  protect_from_forgery except: :api

  def new
  end
  def create
		@m=Message.new(params.require(:messages).permit(:text))
    @m.save
url = "https://jubilant-meme.herokuapp.com/messages/" + @message.id.to_s
render plain: url
  end
  def show
		@m= Message.find(params[:id])
  end

  def api
    json = params.permit(:message)
		@m = Message.new
		@m.text = json.to_h[:message]
		@m.save
    puts @m.text
		url = "https://jubilant-meme.herokuapp.com/messages/" + @m.id.to_s
		url_json = {:url => url}
    render json: url_json.to_json
  end

end
