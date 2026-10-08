defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &is_nil(&1.price))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &rename_item(&1, old_word, new_word))
  end

  defp rename_item(item, old_word, new_word) do
    new_name = String.replace(item.name, old_word, new_word)
    Map.replace(item, :name, new_name)
  end

  def increase_quantity(item, count) do
    new_quantities = Map.new(item.quantity_by_size, fn {k, v} -> {k, v + count} end)

    %{item | quantity_by_size: new_quantities}
  end

  def total_quantity(item) do
    # Enum.reduce(item.quantity_by_size, 0, fn {_, value}, acc -> value + acc end)
    item.quantity_by_size
    |> Map.values()
    |> Enum.sum()
  end
end
