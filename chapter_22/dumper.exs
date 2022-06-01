defmodule My do
  defmacro macro(code) do
    quote do
      IO.inspect(unquote(code))
    end
  end
end

defmodule Test do
  require My

  My.macro("Hello")
  My.macro(:atom)
  My.macro(1)
  My.macro([1, 2, 3])
  My.macro(do: 1)

  My.macro do
    1 + 2
  else
    3 + 4
  end
end
