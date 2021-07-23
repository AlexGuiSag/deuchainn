defmodule DeuchainnWeb.PageController do
  use DeuchainnWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
