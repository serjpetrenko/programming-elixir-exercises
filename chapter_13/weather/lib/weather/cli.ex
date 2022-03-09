defmodule Weather.CLI do
  @columns [:time, :temperature, :wind]

  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of given airport weather information
  """

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help.
  Otherwise it's a github user name, project name and (optionally)
  number of entries to format.
  Return a tuple of `{user, project, count}`, or `:help` if help was given.
  """
  def parse_args(argv) do
    OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    |> elem(1)
    |> args_to_represantation()
  end

  def args_to_represantation(help: true), do: :help

  def args_to_represantation([airport_name]),
    do: String.upcase(airport_name)

  def args_to_represantation(_), do: :help

  def process(:help) do
    IO.puts("""
    usage: weather <airport name>
    """)

    System.halt(0)
  end

  def process(airport_name) do
    Weather.AirportWeather.process(airport_name)
    |> print_response()
  end

  def print_response(result) do
    print_header(result.location)

    Enum.each(@columns, fn column ->
      IO.puts("#{String.capitalize(to_string(column))}: #{result[column]}")
    end)
  end

  defp print_header(location) do
    header = "The weather in airport #{location}"
    IO.puts(header)
    IO.puts(String.duplicate("-", String.length(header)))
  end
end
