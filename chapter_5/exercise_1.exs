list_concat = &(&1 ++ &2)
IO.inspect list_concat.([:a, :b], [:c, :d]) # => [:a, :b, :c, :d]

sum = &(&1 + &2 + &3)
IO.inspect sum.(1, 2, 3) # => 6

pair_tuple_to_list = fn {a, b} -> [a, b] end
IO.inspect pair_tuple_to_list.({1234, 5678})
