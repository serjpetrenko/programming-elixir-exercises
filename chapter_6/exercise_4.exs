defmodule Sum do
  def sum(0), do: 0
  def sum(1), do: 1
  def sum(n) when not is_integer(n) or n < 0, do: {:error, "Expected a positive integer."}
  def sum(n), do: n + sum(n - 1)
end

IO.inspect Sum.sum(-5)
