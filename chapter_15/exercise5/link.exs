defmodule Link do
  import :timer, only: [ sleep: 1 ]

  def run do
    spawn_monitor(Link, :child, [self()])

    sleep(500)

    loop_receive()
  end

  def loop_receive do
    receive do
      msg ->
        IO.puts("Received message: #{inspect msg}")
        loop_receive()
    after 500 -> IO.puts("All messages are received")
    end
  end

  def child(parent) do
    send(parent, "Hello!")
  end
end
