defmodule StashTest do
  use ExUnit.Case

  alias Sequence.Stash

  test "get number" do
    assert Stash.get() == 456
  end

  test "update number" do
    Stash.update(1)
    assert Stash.get() == 1
  end
end
