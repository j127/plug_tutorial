defmodule Dinoapi.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Dinoapi.Router, options: [port: cowboy_port()]}
    ]

    opts = [strategy: :one_for_one, name: Dinoapi.Supervisor]
    Logger.info("starting application")
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:dinoapi, :cowboy_port, 4444)
end
