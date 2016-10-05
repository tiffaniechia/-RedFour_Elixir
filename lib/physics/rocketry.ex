defmodule Physics.Rocketry do
  import Converter
  import Calculus

  @moon %{mass: 7.35e22, radius: 1.738e6}
  @mars %{mass: 6.39e23, radius: 3.4e6}
  @earth %{mass: 5.972e24, radius: 6.371e6}
  @newtons_constant 6.67e-11

  def escape_velocity(:earth), do: @earth |> escape_velocity

  def escape_velocity(:mars), do: @mars |> escape_velocity

  def escape_velocity(:moon) do: @moon |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> convert_to_km
      |> rounded_to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * @newtons_constant * mass / radius
      |> square_root
  end
end
