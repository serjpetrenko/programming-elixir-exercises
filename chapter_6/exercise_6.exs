defmodule Chop do
  def middle(min, max), do: div(min + max, 2)

  def guess(actual, min..max) when div(min + max, 2) > actual do
    IO.puts "It is #{middle(min, max)}"
    guess(actual, min..middle(min, max))
  end

  def guess(actual, min..max) when div(min + max, 2) < actual do
    IO.puts "It is #{middle(min, max)}"
    guess(actual, middle(min, max)..max)
  end

  def guess(actual, min..max), do: IO.puts "It is #{middle(min, max)}"
end

Chop.guess(9,1..20)
