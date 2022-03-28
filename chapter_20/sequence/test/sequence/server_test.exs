defmodule ServerTest do
  use ExUnit.Case

  alias Sequence.Server

  import :timer, only: [ sleep: 1 ]

  setup do
    Server.update_number(1)
  end

  test "next_number increment by 1 initial number" do
    assert Server.next_number == 1
    assert Server.next_number == 2
  end

  test "current_number returns current number" do
    assert Server.current_number == 1
  end

  test "increment_number returns current plus delta" do
    assert :ok = Server.increment_number(2)

    assert Server.current_number == 3
  end

  test "update_number returns new number" do
    assert :ok = Server.update_number(5)

    assert Server.current_number == 5
  end

  test "terminate returns last value before terminating" do
    assert Server.next_number == 1

    Server.increment_number("cat")

    sleep(500)
    assert Server.current_number == 2
  end
end
