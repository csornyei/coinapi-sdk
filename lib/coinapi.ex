defmodule Coinapi do
  use HTTPoison.Base

  @moduledoc """
  Documentation for `Coinapi`.
  """

  @prod_url "https://rest.coinapi.io/"
  @sandbox_url "http://rest-sandbox.coinapi.io/"

  def use_production(options) do
    %Coinapi.Options{options | url: @prod_url}
  end

  def use_sandbox(options) do
    %Coinapi.Options{options | url: @sandbox_url}
  end

  def set_api_key(api_key) do
    %Coinapi.Options{api_key: api_key, url: @prod_url}
  end

  def create_auth_header(%Coinapi.Options{api_key: api_key} = options) do
    %Coinapi.Options{options | headers: [{"X-CoinAPI-Key", api_key}]}
  end

  def metadata_get_exchanges(%Coinapi.Options{url: url, headers: headers}) do
    Coinapi.get(url <> "v1/exchanges", headers)
  end
end
