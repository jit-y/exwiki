defmodule Exwiki.Client do
  @base_url "https://ja.wikipedia.org/w/api.php"

  def get(query, options \\ []) do
    params = %{format: :json, action: :query, prop: :revisions, titles: query, rvprop: :content}
    response = HTTPoison.get!(@base_url, [], params: params)
    response.body
      |> Poison.decode!
  end

  def get(:random, options) do
    params = %{format: :json, action: :query, rnnamespace: 0, rnlimit: 5, list: :random}
    response = HTTPoison.get!(@base_url, [], params: params)
    response.body
      |> Poison.decode!
  end

  def get(_method, options) do
    :error
  end


end
