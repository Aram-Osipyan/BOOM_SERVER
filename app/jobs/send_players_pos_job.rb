class SendPlayersPosJob < ApplicationJob
  queue_as :default
  @@performing = false
  @@thread
  def perform(*args)
    @@performing = true
    redis = Redis.new(host: '127.0.0.1', port: 6379, db: 15)
    @@thread = Thread.new do
      while @@performing
        # mes = redis.mget(redis.keys('pl[0-9]*')).map { |pos| {id=>} }
        keys = redis.keys('pl[0-9]*')
        ActionCable.server.broadcast 'some', keys.empty? ? [] : redis.mget(keys)
        sleep 0.1
      end
    end
  end

  def self.perform?
    @@performing
  end

  def self.stop_perfom
    @@performing = false
    @@thread.kill
  end

end
