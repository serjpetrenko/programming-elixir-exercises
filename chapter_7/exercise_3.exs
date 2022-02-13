defmodule MyList do
  def caesar([], _num), do: []
  def caesar([head | tail], num) when head + num < ?z, do: [head + num | caesar(tail, num)]
  def caesar([_ | tail], num), do: ['?' | caesar(tail, num)]
end

IO.inspect MyList.caesar('ryvkve', 13)
