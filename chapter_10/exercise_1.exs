defmodule MyList do
  def all?([], _func), do: true
  def all?([head | tail], func) do
    if func.(head), do: all?(tail, func), else: false
  end

  def each([], _func), do: []
  def each([head | tail], func), do: [func.(head), each(tail, func)]

  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head), do: [head | filter(tail, func)], else: filter(tail, func)
  end


  def split(list_a, count, list_b \\ [])
  def split(list_a, 0, list_b), do: {list_b, list_a}
  def split([head | tail], count, list_b), do: split(tail, count - 1, list_b ++ [head])

  def take([], _count), do: []
  def take(_, 0), do: []
  def take([head | tail], count), do: [head] ++ take(tail, count - 1)
end

# all?
IO.inspect MyEnum.all?([1, 2, 3], &(&1 > 2)) # false
IO.inspect MyEnum.all?([1, 2, 3], &(&1 > 0)) # true

# each
MyEnum.each([1, 2, 3], &(IO.inspect &1)) # 1 2 3
MyEnum.each([1, 2, 3], &(IO.inspect "Num is #{&1}")) # 1 2 3

# filter
IO.inspect MyEnum.filter([1, 2, 3], &(&1 > 1)) # [2, 3]
IO.inspect MyEnum.filter([1, 2, 3], &(&1 < 0)) # []

# split
IO.inspect MyEnum.split([1, 2, 3], 2) # {[1, 2], [3]}
IO.inspect MyEnum.split([1, 2, 3], 1) # {[1], [2, 3]}

# take
IO.inspect MyEnum.take([1, 2, 3], 2) # [1, 2]
IO.inspect MyEnum.take([1, 2, 3], 1) # [1]
