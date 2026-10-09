defmodule PaintByNumber do
  defp bits_for(bits, color_count) do
    if 2 ** bits >= color_count do
      bits
    else
      bits_for(bits + 1, color_count)
    end
  end

  def palette_bit_size(color_count) do
    bits_for(1, color_count)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    size = palette_bit_size(color_count)
    <<pixel_color_index::size(size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    s = palette_bit_size(color_count)
    <<value::size(^s), _rest::bitstring>> = picture
    value
  end

  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    s = palette_bit_size(color_count)
    <<_value::size(^s), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
