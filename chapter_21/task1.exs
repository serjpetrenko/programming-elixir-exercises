defmodule Fib do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: Fib.of(n - 1) + Fib.of(n - 2)
end


IO.puts("Start the task")

worker = Task.async(fn -> Fib.of(10) end)

IO.puts("Wait for the task to finish")
result = Task.await(worker)

IO.puts("Task finished with result: #{result}")
