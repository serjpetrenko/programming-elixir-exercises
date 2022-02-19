defmodule StringList do
  def center(list) do
    list
    |> Stream.map(&String.pad_leading(&1, div(max_word_length(list) + String.length(&1), 2), "\s"))
    |> Enum.join("\n")
  end

  def max_word_length(list), do: list |> Enum.map(&String.length(&1)) |> Enum.max()
end

IO.puts(StringList.center(["cat", "zebra", "elephant"]))
IO.puts(StringList.center(["Buckethead", "Annisokay", "While She Sleeps"]))
IO.puts(StringList.center(["A", "long time ago", "in a galaxy far, far away..."]))
