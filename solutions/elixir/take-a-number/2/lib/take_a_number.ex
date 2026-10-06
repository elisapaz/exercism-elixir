defmodule TakeANumber do
  defp loop(last_ticket) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, last_ticket)
        loop(last_ticket)

      {:take_a_number, sender_pid} ->
        send(sender_pid, last_ticket + 1)
        loop(last_ticket + 1)

      :stop -> :stop
      _ -> loop(last_ticket)
    end
  end

  def start() do
    spawn(fn ->
      loop(0)
      self()
    end)
  end
end
