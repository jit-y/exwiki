defmodule Exwiki do
  @moduledoc """
  Api client for wiki
  """
  def get(query) do
    Exwiki.Client.get(query)
  end
end
