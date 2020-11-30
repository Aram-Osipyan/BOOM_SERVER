class ChatChannel < ApplicationCable::Channel
  # Вызывается, когда потребитель успешно
  # стал подписчиком этого канала
  def subscribed
    p 'subscribed to chat ogoooooooo'

  end

  def follow
    p 'follow ogoooooooo'
  end


  def recieve(data)
    # p "data : "
    p data
    # g = ActiveSupport::JSON.decode(data)
    p data['some']
  end

end


