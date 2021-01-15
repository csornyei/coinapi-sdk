defmodule Coinapi.OHLCV do
  def get_all_periods(%Coinapi.Options{url: url, headers: headers}) do
    Coinapi.get(url <> "v1/ohlcv/periods", headers)
  end

  def get_latest_data(
        %Coinapi.Options{url: url, headers: headers},
        symbol_id,
        period_id
      ) do
    Coinapi.get(
      url <>
        "v1/ohlcv/#{symbol_id}/latest?period_id=#{period_id}",
      headers
    )
  end

  def get_latest_data(
        %Coinapi.Options{url: url, headers: headers},
        symbol_id,
        period_id,
        %{:limit => limit, :include_empty_items => include_empty_items}
      ) do
    Coinapi.get(
      url <>
        "v1/ohlcv/#{symbol_id}/latest?period_id=#{period_id}&limit=#{limit}&include_empty_items=#{
          include_empty_items
        }",
      headers
    )
  end

  def get_latest_data(
        %Coinapi.Options{url: url, headers: headers},
        asset_id_base,
        asset_id_quote,
        period_id
      ) do
    Coinapi.get(
      url <>
        "v1/ohlcv/#{asset_id_base}/#{asset_id_quote}/latest?period_id=#{period_id}",
      headers
    )
  end

  def get_latest_data(
        %Coinapi.Options{url: url, headers: headers},
        asset_id_base,
        asset_id_quote,
        period_id,
        %{:limit => limit, :include_empty_items => include_empty_items}
      ) do
    Coinapi.get(
      url <>
        "v1/ohlcv/#{asset_id_base}/#{asset_id_quote}/latest?period_id=#{period_id}&limit=#{limit}&include_empty_items=#{
          include_empty_items
        }",
      headers
    )
  end
end
