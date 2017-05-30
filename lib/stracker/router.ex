defmodule STracker.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/v" do
    conn = Plug.Conn.fetch_query_params conn
    %Plug.Conn{query_params: %{"path" => path}} = conn
    STracker.Store.count(path)
    send_resp(conn, 200, ":ok")
  end

  # match _, do: send_resp(conn, 404, "Not found")
  match _, do: send_resp(conn, 404, "Not found #{inspect conn}")
end
