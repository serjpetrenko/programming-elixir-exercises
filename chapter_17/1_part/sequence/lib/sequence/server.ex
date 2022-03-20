defmodule Sequence.Server do
  use GenServer

  def init(arg) do
    {:ok, arg}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, value}, list) do
    {:noreply, [value | list]}
  end

  def terminate(reason, state) do
    IO.puts("The reason is #{inspect reason} with state #{inspect state}")
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "There's my current state #{inspect state}"}]]
  end
end
