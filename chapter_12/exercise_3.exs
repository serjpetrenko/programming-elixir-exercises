defmodule Ok do
  def ok!({:ok, data}), do: data
  def ok!({_, err}), do: raise("There is an error: #{err}")
end

IO.puts(Ok.ok!(File.open("somefile")))
