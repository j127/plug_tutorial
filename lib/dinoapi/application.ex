defmodule Dinoapi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Dinoapi.SalutonMondoPlug, options: [port: 4444]}
    ]

    opts = [strategy: :one_for_one, name: Dinoapi.Supervisor]
    Logger.info("starting application")
    Supervisor.start_link(children, opts)
  end
end
