defmodule MyString do
  def split(str, list \\ [])
  def split(<<>>, list), do: Enum.to_list(list)
  def split(<<head::utf8, tail::binary>>, list), do: split(tail, list ++ [head])
end

IO.inspect MyString.split("Elixir")
IO.inspect MyString.split("Lviv")
