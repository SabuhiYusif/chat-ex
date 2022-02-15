defmodule ChatExWeb.PageController do
  use ChatExWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
