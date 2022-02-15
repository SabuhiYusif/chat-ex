defmodule ChatEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ChatEx.Repo,
      # Start the Telemetry supervisor
      ChatExWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChatEx.PubSub},
      # Start the Endpoint (http/https)
      ChatExWeb.Endpoint
      # Start a worker by calling: ChatEx.Worker.start_link(arg)
      # {ChatEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChatEx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
