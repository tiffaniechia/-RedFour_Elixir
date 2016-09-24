defmodule Converter do
  def calculate_escape(%{mass: mass, radius: radius}) do
    2 * 6.67e-11 * mass / radius
      |> :math.sqrt
  end

  def convert_to_km(velocity) do
    velocity / 1000
  end
end


defmodule Physics.Rocketry do
  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Converter.convert_to_km
      |> Converter.rounded_to_nearest_tenth
  end

  defp rounded_to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end
end
