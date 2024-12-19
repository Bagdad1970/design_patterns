class ISubscriber
  def get_notice
    raise NotImplementedError, "#{self.class} не переопределяет метод '#{__method__}'"
  end
end

class Channel

  attr_accessor :subscribers, :name

  def initialize(name)
    self.subscribers = []
    self.name = name
  end

  def notify_all  # new video
    self.subscribers.each {|subscriber| subscriber.get_notice}
  end

  def subscribe(sub)
    self.subscribers << sub
  end

  def unsubscribe(sub)
    self.subscribers.delete(sub)
  end
end

class Subscriber < ISubscriber
  
  attr_accessor :account_id

  def initialize(account_id)
    self.account_id = account_id
  end

  def get_notice
    puts "New video, #{self.account_id}"
  end

end

def main
  
  sub1 = Subscriber.new(123)
  sub2 = Subscriber.new(48)
  sub3 = Subscriber.new(9)

  rocket_man = Channel.new('Rocket Man')
  rocket_man.subscribe(sub1)
  rocket_man.subscribe(sub2)
  rocket_man.notify_all

  rocket_man.unsubscribe(sub1)
  rocket_man.subscribe(sub3)
  rocket_man.notify_all

end

main
