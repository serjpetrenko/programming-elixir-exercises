defmodule Anagram do
  def call(word1, word2) do
    sort_word(word1) == sort_word(word2)
  end

  def sort_word(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.sort()
    |> Enum.join("")
  end
end

IO.inspect(Anagram.call("Lemon", "Melon"))
IO.inspect(Anagram.call("cats", "dogs"))
