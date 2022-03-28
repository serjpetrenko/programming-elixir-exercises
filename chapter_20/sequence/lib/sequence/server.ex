defmodule Sequence.Server do
  use GenServer

  @me __MODULE__

  @vsn "0"

  #####
  # External API

  def init(_) do
    {:ok, Sequence.Stash.get()}
  end

  def start_link(_) do
    GenServer.start_link(@me, nil, name: @me)
  end

  def current_number do
    GenServer.call(@me, :current_number)
  end

  def next_number do
    GenServer.call(@me, :next_number)
  end

  def update_number(new_number) when is_integer(new_number) do
    GenServer.cast(@me, {:update, new_number})
  end

  def increment_number(delta) do
    GenServer.cast(@me, {:increment_number, delta})
  end

  #####
  # GenServer implementation

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  def handle_call(:current_number, _from, current_number) do
    {:reply, current_number, current_number}
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end

  def handle_cast({:update, new_number}, _current_number) do
    {:noreply, new_number}
  end

  def terminate(_reason, current_number) do
    Sequence.Stash.update(current_number)
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect(state)}'"}]]
  end
end
