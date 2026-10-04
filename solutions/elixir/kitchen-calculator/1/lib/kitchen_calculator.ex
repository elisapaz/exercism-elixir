defmodule KitchenCalculator do
  def get_volume({_, v} = volume_pair), do: v

  def to_milliliter({:cup, v} = volume_pair), do: {:milliliter, 240.0 * v}
  def to_milliliter({:fluid_ounce, v} = volume_pair), do: {:milliliter, 30.0 * v}
  def to_milliliter({:teaspoon, v} = volume_pair), do: {:milliliter, 5.0 * v}
  def to_milliliter({:tablespoon, v} = volume_pair), do: {:milliliter, 15.0 * v}
  def to_milliliter({:milliliter, v} = volume_pair), do: volume_pair


  def from_milliliter({_, v} = volume_pair, :cup), do: {:cup, v / 240.0}
  def from_milliliter({_, v} = volume_pair, :fluid_ounce), do: {:fluid_ounce, v / 30.0}
  def from_milliliter({_, v} = volume_pair, :teaspoon), do: {:teaspoon, v / 5.0}
  def from_milliliter({_, v} = volume_pair, :tablespoon), do: {:tablespoon, v / 15.0}
  def from_milliliter(volume_pair, :milliliter), do: volume_pair

  def convert(volume_pair, unit), do: from_milliliter(to_milliliter(volume_pair), unit)
end
