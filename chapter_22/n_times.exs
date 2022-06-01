defmodule NTimes do
  defmacro times_n(num) do
    name = :"times_#{num}"
    quote do
      def unquote(name)(val) do
        unquote(num) * val
      end
    end
  end
end

defmodule Test do
  require NTimes
  NTimes.times_n(3)
  NTimes.times_n(4)
end

IO.puts Test.times_3(4)   #=> 12
IO.puts Test.times_4(5)   #=> 20
