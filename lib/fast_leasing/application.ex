defmodule FastLeasing.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FastLeasingWeb.Telemetry,
      # Start the Ecto repository
      FastLeasing.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FastLeasing.PubSub},
      # Start Finch
      {Finch, name: FastLeasing.Finch},
      # Start the Endpoint (http/https)
      FastLeasingWeb.Endpoint
      # Start a worker by calling: FastLeasing.Worker.start_link(arg)
      # {FastLeasing.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FastLeasing.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FastLeasingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
