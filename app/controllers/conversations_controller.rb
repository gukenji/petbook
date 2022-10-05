class ConversationsController < ApplicationController
  before_action :load_entities
  before_action :check_conversation, only: [:show]
  def index
    # session[:conversations] ||= []
    # @users = User.all.where.not(id: current_user.id)
    # @conversations = Conversation.includes(:recipient, :messages)
    #                              .find(session[:conversations])
    @friends = User.searchfriends(current_user.id)
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new(conversation_parameters)
  end

  def create
    @conversation = Conversation.new(conversation_parameters)
    respond_to do |format|
      if @conversation.save!
        format.html { redirect_to conversation_path(@conversation.id) }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @conversation_message = Message.new
    @conversation_messages = @conversation.messages.includes(:user)
  end

  def edit; end

  def update
    if @conversation.update_attributes(conversation_parameters)
      redirect_to conversations_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @conversations = Conversation.all
    @conversation = Conversation.find(params[:id]) if params[:id]
  end

  private

  def conversation_parameters
    params.permit(:recipient_id, :sender_id)
  end

  private
  
  def check_conversation
    conversation = Conversation.find(params[:id])
      if conversation.recipient_id != current_user.id && conversation.sender_id != current_user.id
        flash[:alert] = "Sem permissão para ver essa conversa!"
        redirect_to posts_path
      end
  end
end
