defmodule CoinapiTest do
  use ExUnit.Case
  doctest Coinapi

  test "greets the world" do
    assert Coinapi.hello() == :world
  end
end
