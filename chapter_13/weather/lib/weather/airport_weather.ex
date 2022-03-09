defmodule Weather.AirportWeather do
  import SweetXml

  @weather_url Application.get_env(:weather, :weather_url)

  @moduledoc """
  Handle xml response from `https://w1.weather.gov/xml/current_obs/KDTO.xml`
  And format it's in nice view.
  """

  @doc """
  main

  ## Examples

      iex> Weather.main
      :world

  """
  def process(airport_name) do
    url(airport_name)
    |> HTTPoison.get()
    |> handle_response()
    |> deserialize()
  end

  def url(airport_name) do
    "#{@weather_url}/#{airport_name}.xml"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}), do: {:ok, body}
  def handle_response({:ok, %{status_code: code, body: _}}), do: {:bad_code, code}
  def handle_response({:error, %{status_code: _, body: body}}), do: {:error, body}

  def deserialize({:bad_code, code}) do
    IO.puts("There is a bad code #{code}")
    System.halt(1)
  end

  def deserialize({:error, body}) do
    IO.puts("There is an error with response #{body}")
    System.halt(2)
  end

  def deserialize({:ok, body}) do
    %{
      location: body |> xpath(~x"//current_observation/location/text()"),
      time: body |> xpath(~x"//current_observation/observation_time/text()"),
      temperature: body |> xpath(~x"//current_observation/temperature_string/text()"),
      wind: body |> xpath(~x"//current_observation/wind_string/text()")
    }
  end
end
