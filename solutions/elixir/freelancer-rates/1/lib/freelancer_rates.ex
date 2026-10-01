defmodule FreelancerRates do
  @doc """
  Returns daily rate given the hourly rate
  """
  @spec daily_rate(number()) :: float()
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  @doc """
  Calculates price after a discount
  """
  @spec apply_discount(number(), number()) :: float()
  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - discount / 100.0)
  end

  @doc """
  Calculates monthly rate and applies discount
  """
  @spec monthly_rate(number(), number()) :: integer()
  def monthly_rate(hourly_rate, discount) do
    raw_monthly = 22.0 * daily_rate(hourly_rate)
    ceil(apply_discount(raw_monthly, discount))
  end

  @doc """
  Given a budget, hourly rate and discount, calculates how many days
  of work that covers
  """
  @spec days_in_budget(number(), number(), number()) :: integer()
  def days_in_budget(budget, hourly_rate, discount) do
    per_day = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / per_day, 1)
  end
end
