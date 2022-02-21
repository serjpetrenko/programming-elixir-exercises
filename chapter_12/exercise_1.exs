defmodule FizzBuzz do
  def fizz_buzz(n) do
    case n do
      n when rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
      n when rem(n, 3) == 0 -> "Fizz"
      n when rem(n, 5) == 0 -> "Buzz"
      _ -> n
    end
  end
end

IO.inspect(10..16 |> Enum.to_list() |> Enum.map(&FizzBuzz.fizz_buzz/1))
