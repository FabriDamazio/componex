defmodule ComponexMaterial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: ComponexMaterial.Supervisor]
    Supervisor.start_link([], opts)
  end
end
