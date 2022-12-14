class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    conversation = Conversation.find(params[:conversation_id])
    stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    conversation = Conversation.find(params[:conversation_id])
    ActionCable.server.broadcast(conversation, data)
  end
end
