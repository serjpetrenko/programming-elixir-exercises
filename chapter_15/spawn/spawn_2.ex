defmodule Spawn2 do
  def greet do
    receive do
      {sender, message} ->
        send(sender, { :ok, "Hello, #{message}" })
      greet()
    end
  end
end

pid = spawn(Spawn2, :greet, [])
send(pid, {self(), "World!"})

receive do
  {:ok, message} ->
    IO.puts(message)
end

send(pid, {self(), "Elixir!"})
receive do
  {:ok, message} ->
    IO.puts(message)
  after 500 ->
    IO.puts("Process finished")
end
