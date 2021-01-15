defmodule Coinapi.Metadata do
  def get_exchanges(%Coinapi.Options{url: url, headers: headers}) do
    Coinapi.get(url <> "v1/exchanges", headers)
  end

  def get_exchanges(%Coinapi.Options{url: url, headers: headers}, filter) do
    Coinapi.get(url <> "v1/exchanges?filter_exchange_id=#{filter}", headers)
  end

  def get_all_exchange_icons(%Coinapi.Options{url: url, headers: headers}, icon_size) do
    Coinapi.get(url <> "v1/exchanges/icons/#{icon_size}", headers)
  end

  def get_all_assets(%Coinapi.Options{url: url, headers: headers}) do
    Coinapi.get(url <> "v1/assets", headers)
  end

  def get_all_assets(%Coinapi.Options{url: url, headers: headers}, filter) do
    Coinapi.get(url <> "v1/assets?filter_asset_id=#{filter}", headers)
  end

  def get_all_assets_icons(%Coinapi.Options{url: url, headers: headers}, icon_size) do
    Coinapi.get(url <> "v1/assets/icons/#{icon_size}", headers)
  end

  def get_all_symbols(%Coinapi.Options{url: url, headers: headers}) do
    Coinapi.get(url <> "v1/symbols/", headers)
  end

  def get_all_symbols(%Coinapi.Options{url: url, headers: headers}, exchange_id) do
    Coinapi.get(url <> "v1/symbols/#{exchange_id}", headers)
  end

  def get_all_symbols(
        %Coinapi.Options{url: url, headers: headers},
        filter_symbol_id,
        filter_exchange_id,
        filter_asset_id
      ) do
    Coinapi.get(
      url <>
        "v1/symbols?filter_symbol_id=#{filter_symbol_id}&filter_exchange_id=#{filter_exchange_id}&filter_asset_id=#{
          filter_asset_id
        }",
      headers
    )
  end
end
