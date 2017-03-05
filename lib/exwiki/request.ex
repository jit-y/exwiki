defmodule Exwiki.Request do
  @base_url "https://ja.wikipedia.org/w/api.php"

  def to_url(map) do
    @base_url <> "?" <> to_query(map)
  end

  def to_query(map) do
    URI.encode_query(map)
  end
end
