defmodule Gallows.Application do
  use Application
  
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(GallowsWeb.Endpoint, [])
    ]

    opts = [
      name: Gallows.Supervisor,
      strategy: :one_for_one
    ]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    GallowsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
