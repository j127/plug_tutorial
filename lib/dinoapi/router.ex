defmodule Dinoapi.Router do
  use Plug.Router

  # tos looks for a handle_errors/2 function
  use Plug.ErrorHandler

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

  defp handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "something went wrong")
  end
end
