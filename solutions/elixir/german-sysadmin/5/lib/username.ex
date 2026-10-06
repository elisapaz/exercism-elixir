defmodule Username do
  def sanitize([]), do: ~c""
  def sanitize([hd | tl]) do
    clean = case hd do
      hd when hd == ?_ or hd in ?a..?z -> [hd | sanitize(tl)]
      # ä becomes ae
      ?ä -> ~c"ae"
      # ö becomes oe
      ?ö -> ~c"oe"
      # ü becomes ue
      ?ü -> ~c"ue"
      # ß becomes ss
      ?ß -> ~c"ss"
      _ -> ~c""
      clean ++ sanitize(tl)
    end
  end
end
