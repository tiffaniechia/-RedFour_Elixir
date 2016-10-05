defmodule Converter do
  def rounded_to_nearest_tenth(val), do: Float.round(val, 1)

  def to_km(velocity), do: velocity / 1000

  def to_meters(velocity), do: velocity * 1000

  def to_light_seconds({unit, val}, precision: precision) do
    case unit do
      :meters -> from_meters(val)
      :miles -> from_miles(val)
      :feet -> from_feet(val)
      :inches -> from_inches(val)
    end |> round_to(precision)
  end

  defp from_meters(val), do: val * 3.335638620368e-9

  defp from_miles(val), do: val * 5.36819e-6

  defp from_feet(val), do: val * 1.016702651488166404e-9

  defp from_inches(val), do: val * 8.472522095734715723e-11

  defp round_to(val, precision) when is_float(val), do: Float.round(val, precision)
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
