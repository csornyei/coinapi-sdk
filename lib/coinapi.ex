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

  def parse_response({_status, %HTTPoison.Response{body: body, status_code: status_code}}) do
    case status_code do
      200 ->
        {:ok, Poison.decode!(body)}

      400 ->
        {:error, "There is something wrong with your request"}

      401 ->
        {:error, "Your API key is wrong"}

      403 ->
        {:error, "Your API key doesnt't have enough privileges to access this resource"}

      429 ->
        {:error, "You have exceeded your API key rate limits"}

      550 ->
        {:error, "You requested specific single item that we don't have at this moment."}
    end
  end
end
