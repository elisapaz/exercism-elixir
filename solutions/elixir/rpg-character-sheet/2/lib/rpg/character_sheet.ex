defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    String.trim(IO.gets("What is your character's name?\n"))
  end

  def ask_class() do
    String.trim(IO.gets("What is your character's class?\n"))
  end

  def ask_level() do
    level = IO.gets("What is your character's level?\n")
    String.to_integer(String.trim(level))
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    values = %{class: class, level: level, name: name}
    IO.puts("Your character: " <> "#{inspect(values)}")
    IO.inspect(values, :label)
  end
end
