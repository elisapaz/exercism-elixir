defmodule Username do
  def sanitize([]), do: ~c""
  def sanitize([hd | tl]) do
    case hd do
      hd when hd == ?_ or hd in ?a..?z -> [hd | sanitize(tl)]
      # ä becomes ae
      hd when hd == ?ä -> ~c"ae" ++ sanitize(tl)
      # ö becomes oe
      hd when hd == ?ö -> ~c"oe" ++ sanitize(tl)
      # ü becomes ue
      hd when hd == ?ü -> ~c"ue" ++ sanitize(tl)
      # ß becomes ss
      hd when hd == ?ß -> ~c"ss" ++ sanitize(tl)
      _ -> sanitize(tl)
    end

    # Please implement the sanitize/1 function
  end
end
