defmodule CliTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  doctest Weather

  import Weather.CLI, only: [parse_args: 1, print_response: 1]

  @response %{
    location: "St. Johns, St. Johns Industrial Airpark, AZ",
    time: "Last Updated on Mar 9 2022, 11:54 am MST",
    temperature: "50.0 F (10.0 C)",
    wind: "Northwest at 10.4 MPH (9 KT)"
  }

  test ":help returned by option passing with -h and --help optons" do
    assert parse_args(["-h"]) == :help
    assert parse_args(["--help"]) == :help
  end

  test "returns upcase name if airport name given" do
    assert parse_args(["ksjn"]) == "KSJN"
  end

  test "print_response" do
    result =
      capture_io(fn ->
        print_response(@response)
      end)

    assert result == """
           The weather in airport St. Johns, St. Johns Industrial Airpark, AZ
           ------------------------------------------------------------------
           Time: Last Updated on Mar 9 2022, 11:54 am MST
           Temperature: 50.0 F (10.0 C)
           Wind: Northwest at 10.4 MPH (9 KT)
           """
  end
end
