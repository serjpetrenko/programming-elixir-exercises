defmodule MyList do
  def max([]), do: 0
  def max([head | [second | tail]]) when head > second, do: max([head | tail])
  def max([head | [second | tail]]) when head < second, do: max([second | tail])
  def max([head | _]), do: head
end

IO.inspect MyList.max([1, 2, 3])
