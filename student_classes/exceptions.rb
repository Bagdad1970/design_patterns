class DataBaseError < StandardError
  def initialize(message)
    super(message)
  end
end

class DataBaseConnectionError < DataBaseError
  def initialize(message="Истекло время подключения к базе данных")
    super(message)
  end
end

class DataBaseDisconnectedError < DataBaseError
  def initialize(message="База данных была отключена")
    super(message)
  end
end

class DataBaseClientNotConnectedError < DataBaseError
  def initialize(message="Нет подключения к базе данных")
    super(message)
  end
end
