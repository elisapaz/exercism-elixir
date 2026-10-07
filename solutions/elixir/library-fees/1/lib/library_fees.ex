defmodule LibraryFees do
  def datetime_from_string(string) do
    {_, val} = NaiveDateTime.from_iso8601(string)
    val
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29
    checkout_datetime
      |> NaiveDateTime.add(days, :day)
      |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)
    if Date.before?(planned_return_date, actual_return_date) do
      Date.diff(actual_return_date, planned_return_date)
    else
      0
    end
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    dt_return = datetime_from_string(return)
    days_late =
      checkout
      |> datetime_from_string()
      |> return_date()
      |> days_late(dt_return)

    if monday?(dt_return), do: Float.floor(days_late * rate / 2), else: days_late * rate
  end
end
