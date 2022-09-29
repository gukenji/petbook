class ConversationsController < ApplicationController
  before_action :load_entities
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
        format.html { redirect_to request.referrer }
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

  def edit
  end

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
end