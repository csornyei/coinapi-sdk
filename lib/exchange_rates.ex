defmodule Coinapi.Exchange_rates do
  def get_specific_rate(
        %Coinapi.Options{url: url, headers: headers},
        asset_id_base,
        asset_id_quote
      ) do
    Coinapi.get(url <> "v1/exchangerate/#{asset_id_base}/#{asset_id_quote}", headers)
  end

  def get_specific_rate(
        %Coinapi.Options{url: url, headers: headers},
        asset_id_base,
        asset_id_quote,
        time
      ) do
    Coinapi.get(url <> "v1/exchangerate/#{asset_id_base}/#{asset_id_quote}?time=#{time}", headers)
  end

  def get_all_current_rates(
        %Coinapi.Options{url: url, headers: headers},
        asset_id_base,
        invert \\ false
      ) do
    Coinapi.get(url <> "v1/exchangerate/#{asset_id_base}?invert=#{invert}", headers)
  end
end
