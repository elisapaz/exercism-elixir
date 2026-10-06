defmodule Username do
  def sanitize([]), do: ~c""
  def sanitize([hd | tl]) do
    case hd do
      hd when hd == ?_ or hd in ?a..?z -> [hd | sanitize(tl)]
      # ä becomes ae
      ?ä -> ~c"ae" ++ sanitize(tl)
      # ö becomes oe
      ?ö -> ~c"oe" ++ sanitize(tl)
      # ü becomes ue
      ?ü -> ~c"ue" ++ sanitize(tl)
      # ß becomes ss
      ?ß -> ~c"ss" ++ sanitize(tl)
      _ -> sanitize(tl)
    end
  end
end
