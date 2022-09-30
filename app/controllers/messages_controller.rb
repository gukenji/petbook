class MessagesController < ApplicationController

  def create
    @conversation_message = Message.new(messages_parameters)
    @conversation = Conversation.find(@conversation_message.conversation_id)
    respond_to do |format|
      if @conversation_message.save!
        ConversationChannel.broadcast_to(@conversation, @conversation_message)
        format.html { redirect_to request.referrer}
        format.json { render :show, status: :created, location: @conversation_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversation_message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def messages_parameters
    params.require(:message).permit(:body, :user_id, :conversation_id)
  end


end