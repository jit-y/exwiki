defmodule Exwiki.Client do
  import Exwiki.Query
  @base_url "https://ja.wikipedia.org/w/api.php"
  def get(:random) do
    query = %{format: :json, action: :query, rnnamespace: 0, rnlimit: 5, list: :random}
    url = to_url(query)
    response = HTTPoison.get!(url)
    response.body
      |> Poison.decode!
  end

  def get(_method) do
    :error
  end
end
