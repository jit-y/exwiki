defmodule Exwiki.Client do
  import Exwiki.Request
  @base_url "https://ja.wikipedia.org/w/api.php"
  def get(query) when is_binary(query) do
    params = %{format: :json, action: :query, prop: :revisions, titles: query, rvprop: :content}
    url = to_url(params)
    response = HTTPoison.get!(url)
    response.body
      |> Poison.decode!
  end

  def get(:random) do
    params = %{format: :json, action: :query, rnnamespace: 0, rnlimit: 5, list: :random}
    url = to_url(params)
    response = HTTPoison.get!(url)
    response.body
      |> Poison.decode!
  end

  def get(_method) do
    :error
  end
end
