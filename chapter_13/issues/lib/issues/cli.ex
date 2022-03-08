defmodule Issues.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of the last _n_ issues in a github project
  """

  @default_count 4

  import Issues.TableFormatter, only: [print_table_for_columns: 2]

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

  def process({user, project, count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response()
    |> sort_desc()
    |> Enum.take(count)
    |> print_table_for_columns(["number", "created_at", "title"])
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    IO.puts("Error fetching from Github: #{error["message"]}")
    System.halt(2)
  end

  def sort_desc(list) do
    list
    |> Enum.sort(fn el1, el2 -> el1["created_at"] >= el2["created_at"] end)
  end
end
