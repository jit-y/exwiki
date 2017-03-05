defmodule Exwiki.Query do
  @base_url "https://ja.wikipedia.org/w/api.php"

  def to_url(map) do
    @base_url <> "?" <> to_query(map)
  end

  def to_query(map) do
    Enum.map_join(map, "&", fn {k, v} -> "#{k}=#{v}" end)
  end
end
