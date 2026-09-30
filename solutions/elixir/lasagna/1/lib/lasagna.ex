defmodule Lasagna do
  @doc """
  Returns the expected minutes in oven
  """
  @spec expected_minutes_in_oven :: integer()
  def expected_minutes_in_oven do
    40
  end

  @doc """
  Returns the remaining minutes in oven
  """
  @spec remaining_minutes_in_oven(integer()) :: integer()
  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end

  @doc """
  Returns preparation time of the lasagna
  given the number of layers (2 mins per layer)
  """
  @spec preparation_time_in_minutes(integer()) :: integer()
  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  @doc """
  Returns the total time worked on the lasagna
  given the amount of layers and the time the lasagna has spent at the moment
  """
  @spec total_time_in_minutes(integer(), integer()) :: integer()
  def total_time_in_minutes(layers, minutes_in_oven) do
    preparation_time_in_minutes(layers) + minutes_in_oven

  end

  @doc """
  Returns a message indicating that the lasagna is ready to eat
  """
  @spec alarm :: String.t()
  def alarm do
    "Ding!"
  end

end
