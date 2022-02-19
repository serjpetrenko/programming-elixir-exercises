defmodule MyString do
  def capitalize_sentences(sentence) do
    sentence
    |> String.split(" ")
    |> Stream.map(&(String.capitalize(&1)))
    |> Enum.join(" ")
  end
end

IO.puts MyString.capitalize_sentences("oh. a DOG. woof. ")
IO.puts MyString.capitalize_sentences("elixir is An AMAZING language. ")
