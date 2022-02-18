defmodule CheckCharList do
  def call([]), do: true
  def call([head | tail]) when head in ?a..?z, do: call(tail)
  def call(_), do: false
end

IO.inspect CheckCharList.call([])
