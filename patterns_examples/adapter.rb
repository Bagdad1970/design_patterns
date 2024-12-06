class EuropeanCharging

  def specific_plug_to_socket
    puts "Европейская зарядка подключена"
  end

end

class AmericanCharging

  def plug_to_socket
    puts "Американская зарядка подключена"
  end

end

class ChargingAdapter

  def initialize(charging)
    @charging_adapter = charging
  end

  def plug_to_socket
    @charging_adapter.specific_plug_to_socket
  end

end

def main
  american_charging = AmericanCharging.new
  american_charging.plug_to_socket

  european_charging = EuropeanCharging.new
  charging_adapter = ChargingAdapter.new(european_charging)
  charging_adapter.plug_to_socket
end

main

