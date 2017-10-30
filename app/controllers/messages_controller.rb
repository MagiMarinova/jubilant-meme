class MessagesController < ApplicationController
  def new
  end
  def create
    
		@m=Message.new(params.require(:messages).permit(:text))
    @m.save
  end
  def show
		@m= Message.find(params[:id])
  end
end
