class TextController < ApplicationController
  def input
  end
  def creat
		@m=Message.new(params.require(:messages).permit(:text))
    @m.save
  end
  def output
		@m= Message.find(params[:id])
  end
end
