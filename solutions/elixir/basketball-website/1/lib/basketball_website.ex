defmodule BasketballWebsite do

  defp recursive_extract_from_path(data, [h | []]) do
    data[h]
  end
  defp recursive_extract_from_path(data, [h | t]) do
    recursive_extract_from_path(data[h], t)
  end

  def extract_from_path(data, path) do
    recursive_extract_from_path(data, String.split(path, "."))
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
