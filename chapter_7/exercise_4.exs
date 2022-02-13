defmodule MyList do
  def span(a, b) when a > b, do: []
  def span(a, b), do: [a | span(a + 1, b)]
end

IO.inspect MyList.span(1, 4)
