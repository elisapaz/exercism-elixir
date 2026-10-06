defmodule Username do
  def sanitize([]), do: ~c""
  def sanitize([head | tail]) do
    clean = case head do
      head when head == ?_ or head in ?a..?z -> [head]
      # ä becomes ae
      ?ä -> ~c"ae"
      # ö becomes oe
      ?ö -> ~c"oe"
      # ü becomes ue
      ?ü -> ~c"ue"
      # ß becomes ss
      ?ß -> ~c"ss"
      _ -> ''
    end
    clean ++ sanitize(tail)
  end
end
