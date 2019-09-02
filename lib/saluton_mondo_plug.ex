defmodule Dinoapi.SalutonMondoPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "saluton mondo\n")
  end
end
