defmodule PortfolioWeb.MindmapLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, menu_open: false)}
  end

  def handle_event("toggle_hamburger", _value, socket = %{assigns: %{menu_open: menu_open}}) do
    toggled = !menu_open

    {:noreply,
     socket
     |> assign(menu_open: toggled)}
  end

  def handle_event("play", _, socket) do
    {:noreply, push_redirect(socket, to: "/game/playing")}
  end

  def handle_event("hangman", _, socket) do
    {:noreply, push_redirect(socket, to: "/hangman")}
  end

  def handle_event("mindmap", _, socket) do
    {:noreply, push_redirect(socket, to: "/mindmap")}
  end

  def handle_event("root", _, socket) do
    {:noreply, push_redirect(socket, to: "/")}
  end
end
