defmodule Sequence do
  @server Sequence.Server

  def start_link(list) do
    GenServer.start_link(@server, list, name: @server)
  end

  def pop do
    GenServer.call(@server, :pop)
  end

  def push(value) do
    GenServer.cast(@server, {:push, value})
  end
end
