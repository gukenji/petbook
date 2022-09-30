class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, inverse_of: :messages

  def self.formatTime(id)
    message_time = Message.find(id).created_at.in_time_zone('America/Sao_Paulo')
    message_time.to_s(:short)
  end
  
  # inclui na mensagem transmitida o atributo do caminho da url da imagem de profile
  def as_json(options)
    super(options).merge(user_avatar_url: user.avatar_url)
  end

  
end
