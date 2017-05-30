defmodule STracker.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = Application.get_env(:stracker, :port)
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, STracker.Router, [], port: port),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: STracker.Supervisor]
    r = Supervisor.start_link(children, opts)
    Logger.info("Started at port #{port}.")
    r
  end
end
