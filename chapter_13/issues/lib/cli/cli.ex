defmodule Issues.CLI do
  @default_count 4

  @moduledoc """
  Handling the command line parsing and the dispatch
  to the various functions that end up a generating a table
  of the last n issues in a github project
  """

  def run(argv) do
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

  def args_to_represantation([user, project, count]),
    do: {user, project, String.to_integer(count)}

  def args_to_represantation([user, project]), do: {user, project, @default_count}
  def args_to_represantation(_), do: :help

  def process(:help) do
    IO.puts("""
    usage: issues <user> <project> [count | #{@default_count}]
    """)

    System.halt(0)
  end

  def process({user, project, _count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response()
  end

  def decode_response({:ok, body}), do: body
  def decode_response({:error, error}) do
    IO.puts("Error fetching from Github: #{error["message"]}")
    System.halt(2)
  end
end
