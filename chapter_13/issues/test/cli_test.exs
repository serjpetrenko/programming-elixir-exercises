defmodule CliTest do
  use ExUnit.Case

  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  test ":help returned by option passing with -h and --help optons" do
    assert parse_args(["-h"]) == :help
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "returns three values if three given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "add default_count if two values was given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
