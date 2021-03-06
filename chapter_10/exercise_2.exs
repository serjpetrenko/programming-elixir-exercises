defmodule MyList do
  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head), do: flatten(head) ++ flatten(tail)
  def flatten([head | tail]), do: [head] ++ flatten(tail)
end

IO.inspect MyList.flatten([1, [2, 3, [4] ], 5, [[[6]]]])
