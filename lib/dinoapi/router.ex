defmodule Dinoapi.Router do
  use Plug.Router
  alias Dinoapi.Plug.VerifyRequest

  plug Plug.Parsers, parsers: [:urlencoded, :multipart]

  # This will require URL params like: ?content=foo&mimetype=bar
  plug VerifyRequest, fields: ["content", "mimetype"], paths: ["/upload"]

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "bonvenon")
  end

  get "/upload" do
    send_resp(conn, 201, "Uploaded")
  end

  match _ do
    send_resp(conn, 404, "404 ne trovita")
  end
end
