defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    new("none")
  end

  def new(nickname) do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{} = remote_car) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0} = remote_car) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: b} = remote_car) do
    "Battery at #{b}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car) do
    remote_car
  end

  def drive(%RemoteControlCar{battery_percentage: b, distance_driven_in_meters: d} = remote_car) do
    %{remote_car | battery_percentage: b - 1, distance_driven_in_meters: d + 20}
  end
end
