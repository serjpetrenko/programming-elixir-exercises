defmodule Calculator do
  def calculate(formula) when is_list(formula) do
    [num1, op, num2] = List.to_string(formula) |> String.split(" ")
    {num1, _} = Float.parse(num1)
    {num2, _} = Float.parse(num2)

    case op do
      "+" -> num1 + num2
      "-" -> num1 - num2
      "*" -> num1 * num2
      "/" -> num1 / num2
    end
  end

  def calculate(_), do: raise("Not a list")
end

IO.inspect Calculator.calculate('100 + 20') # 120
IO.inspect Calculator.calculate('100 - 20') # 80
IO.inspect Calculator.calculate('100 * 20') # 2000
IO.inspect Calculator.calculate('100 / 20') # 5
IO.inspect Calculator.calculate("Hello") # error "Not a list"
