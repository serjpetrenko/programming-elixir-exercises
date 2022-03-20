defmodule Sequence.Server do
  use GenServer

  def init(arg) do
    {:ok, arg}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end

  def handle_cast({:push, value}, list) do
    {:noreply, [value | list]}
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "There's my current state #{inspect state}"}]]
  end
end
