defmodule Converter do
  def rounded_to_nearest_tenth(val) do
    Float.round(val, 1)
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def to_meters(velocity) do
    velocity * 1000
  end

  def to_light_seconds({:meters, meters} = val, precision: precision) do
    meters * 3.335638620368e-9 |> round_up(precision)
  end

  def to_light_seconds({:miles, miles} = val, precision: precision) do
    miles * 5.36819e-6 |> round_up(precision)
  end

  def to_light_seconds({:feet, feet} = val, precision: precision) do
    feet * 1.016702651488166404e-9 |> round_up(precision)
  end

  def to_light_seconds({:inches, inches} = val, precision: precision) do
    inches * 8.472522095734715723e-11 |> round_up(precision)
  end

  def round_to(val, precision) when is_float(val) do
    Float.round(val, precision)
  end
end


defmodule Physics.Rocketry do
  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6}
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Converter.convert_to_km
      |> Converter.rounded_to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * 6.67e-11 * mass / radius
      |> :math.sqrt
  end
end
