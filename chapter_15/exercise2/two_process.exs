defmodule TwoProcess do
  def run do
    betty = spawn(TwoProcess, :betty, [])
    fred = spawn(TwoProcess, :fred, [])

    send(betty, {self(), "Betty"})
    send(fred, {self(), "Fred"})

    receive do
      {_, "Betty"} ->
        IO.puts("Received first response from Betty")
      {_, "Fred"} ->
        IO.puts("Received first response from Fred")
    end

    receive do
      {_, "Betty"} ->
        IO.puts("Received second response from Betty")
      {_, "Fred"} ->
        IO.puts("Received second response from Fred")
    end
  end

  def betty do
    receive do
      {sender, "Betty"} ->
        send(sender, {self(), "Betty"})
    end
  end

  def fred do
    receive do
      {sender, "Fred"} ->
        send(sender, {self(), "Fred"})
    end
  end
end
