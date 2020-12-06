class SendPlayersPosJob < ApplicationJob
  queue_as :default
  @@performing = false
  def perform(*args)
    @@performing = true
    Thread.new do
      while @@performing
        ActionCable.server.broadcast 'some', 'data'
        sleep 1
      end
    end
  end

  def self.perform?
    @@performing
  end

end