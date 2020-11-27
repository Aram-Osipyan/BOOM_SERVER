class ChatChannel < ApplicationCable::Channel
  # Вызывается, когда потребитель успешно
  # стал подписчиком этого канала
  def subscribed
    p "subscibed to chat"
    stream_from “chat_channel_1”
  end

end


