prefix = fn prefix_string ->
  fn postfix_string ->
    "#{prefix_string} #{postfix_string}"
  end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
