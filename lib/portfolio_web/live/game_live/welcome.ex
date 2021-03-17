defmodule PortfolioWeb.GameLive.Welcome do
  use PortfolioWeb, :live_view
  alias Portfolio.Tetris.Game

  def mount(_params, _session, socket) do
    {:ok, assign(socket, menu_open: false, game: Map.get(socket.assigns, :game) || Game.new())}
  end

  defp play(socket) do
    push_redirect(socket, to: "/game/playing")
  end

  def handle_event("play", _, socket) do
    {:noreply, play(socket)}
  end
end
