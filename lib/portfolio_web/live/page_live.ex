defmodule PortfolioWeb.PageLive do
  use PortfolioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, menu_open: true)}
  end

  def page_live_func do
    'TESTING'
  end

  def handle_event("toggle_hamburger", _value, socket = %{assigns: %{menu_open: menu_open}}) do
    toggled = !menu_open

    {:noreply,
     socket
     |> put_flash(:error, "asdf")
     |> assign(menu_open: toggled)}
  end

  defp play(socket) do
    push_redirect(socket, to: "/game/playing")
  end

  defp mindmap(socket) do
    push_redirect(socket, to: "/mindmap")
  end

  defp root(socket) do
    push_redirect(socket, to: "/")
  end

  def handle_event("play", _, socket) do
    {:noreply, play(socket)}
  end

  def handle_event("mindmap", _, socket) do
    {:noreply, mindmap(socket)}
  end

  def handle_event("root", _, socket) do
    {:noreply, root(socket)}
  end
end
