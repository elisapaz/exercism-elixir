defmodule LogLevel do
  @spec to_label(integer(), boolean()) :: atom()
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      end
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :true
      true -> :unknown
    end
  end

  @spec alert_recipient(integer(), boolean()) :: atom()
  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label == :error -> :ops
      label == :fatal -> :ops
      label == :unknown -> cond do
        legacy? -> :dev1
        true -> :dev2
      end
      true -> false
    end
  end
end
