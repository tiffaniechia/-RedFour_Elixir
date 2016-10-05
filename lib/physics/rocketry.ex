defmodule Physics.Rocketry do
  import Converter

  @moon %{mass: 7.35e22, radius: 1.738e6}
  @mars %{mass: 6.39e23, radius: 3.4e6}
  @earth %{mass: 5.972e24, radius: 6.371e6}

  def escape_velocity(:earth) do
    @earth
      |> escape_velocity
  end

  def escape_velocity(:mars) do
    @mars
      |> escape_velocity
  end

  def escape_velocity(:moon) do
    @moon
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
