defmodule MyList do
  def span(a, b) when a > b, do: []
  def span(a, b), do: [a | span(a + 1, b)]
end

n = 10

IO.inspect(
  for x <- MyList.span(2, n), Enum.all?(MyList.span(2, x - 1), &(rem(x, &1) != 0)), do: x
)
