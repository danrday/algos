defmodule PortfolioWeb.MindmapLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, menu_open: false)}
  end
end
