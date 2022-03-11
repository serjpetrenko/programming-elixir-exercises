defmodule AirportWeatherTest do
  use ExUnit.Case

  alias Weather.AirportWeather, as: AW

  test "url with airport name" do
    assert AW.url("KDTO") == "https://w1.weather.gov/xml/current_obs/KDTO.xml"
  end

  describe "deserialize/1" do
    test "deserialize with success data" do
      body = """
      <?xml version="1.0" encoding="ISO-8859-1"?>
      <?xml-stylesheet href="latest_ob.xsl" type="text/xsl"?>
      <current_observation version="1.0"
        xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="http://www.weather.gov/view/current_observation.xsd">
        <suggested_pickup>15 minutes after the hour</suggested_pickup>
        <suggested_pickup_period>60</suggested_pickup_period>
        <location>Denton Enterprise Airport, TX</location>
        <station_id>KDTO</station_id>
        <observation_time>Last Updated on Mar 10 2022, 12:53 am CST</observation_time>
        <wind_string>Southeast at 6.9 MPH (6 KT)</wind_string>
        <temperature_string>41.0 F (5.0 C)</temperature_string>
      </current_observation>
      """

      assert AW.deserialize({:ok, body}) == %{
               location: 'Denton Enterprise Airport, TX',
               temperature: '41.0 F (5.0 C)',
               time: 'Last Updated on Mar 10 2022, 12:53 am CST',
               wind: 'Southeast at 6.9 MPH (6 KT)'
             }
    end
  end
end
