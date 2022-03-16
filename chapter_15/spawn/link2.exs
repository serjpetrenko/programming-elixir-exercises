defmodule Link2 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    spawn_link(Link2, :sad_function, [])

    receive do
      msg ->
        IO.puts("Message received: #{msg}")
    after 500 -> IO.puts("Nothing happened")
    end
  end
end
