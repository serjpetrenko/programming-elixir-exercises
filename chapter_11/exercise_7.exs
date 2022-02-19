defmodule OrdersWithRates do
  def calculate(tax_rates, orders) do
    for order <- orders,
        do:
          Keyword.put(
            order,
            :total_amount,
            total_amount(order, tax_rates)
          )
  end

  defp total_amount(order, tax_rates) do
    order[:net_amount] + Keyword.get(tax_rates, Keyword.get(order, :ship_to), 0)
  end
end

defmodule ParseCsv do
  def parse do
    file = File.open!("orders.csv")
    [_header | lines] = Enum.map(IO.stream(file, :line), &String.trim(&1))

    Enum.map(lines, &create_keyword_list/1)
  end

  def create_keyword_list(line) do
    [id, ship_to, net_amount] = String.split(line, ",")
    {id, _} = Integer.parse(id)
    ship_to = String.replace(ship_to, ":", "") |> String.to_atom()
    {net_amount, _} = Float.parse(net_amount)
    Keyword.new([{:id, id}, {:ship_to, ship_to}, {:net_amount, net_amount}])
  end
end

tax_rates = [NC: 0.075, TX: 0.08]

IO.inspect(OrdersWithRates.calculate(tax_rates, ParseCsv.parse()))
