fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, c) -> c
end

new_fizz = fn (n) -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end
IO.puts 10..16 |> Enum.to_list |> Enum.map(fn(n) -> new_fizz.(n) end)
