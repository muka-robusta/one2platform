defmodule One2.PageController do
  use One2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
