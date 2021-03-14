defmodule TetrisWeb.GameLive do
  use TetrisWeb, :live_view
  alias Tetris.{Tetromino, Game}

  @rotate_keys ["ArrowUp", " "]

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(200, :tick)
    end

    {:ok, new_game(socket)}
  end

  def render(assigns) do
    ~L"""
    <% {x,y} = @game.tetro.location%>
    <section class="phx-hero">
      <div phx-window-keydown="keystroke">
        <h1>Welcome to Tetris</h1>
        <%= render_board(assigns) %>
        <pre>
          {<%= x %> <%= y %>}
          <h1><%= inspect @game.tetro.location %></h1>
        </pre>
      </div>
    </section>
    """
  end

  defp render_board(assigns) do
    ~L"""
      <svg width="200" height="400">
        <rect width="200" height="400" style="fill:rgb(0,0,0);"/>
        <%= render_points(assigns) %>
      </svg>
    """
  end

  defp render_points(assigns) do
    ~L"""
      <%= for {x, y, shape} <- @game.points do %>
        <rect width="20"
              height="20"
              x="<%= x * 20 %>"
              y="<%= y * 20 %>"
              style="fill:<%= color(shape) %>;"/>
      <% end %>
    """
  end

  defp color(:l), do: "red"
  defp color(:j), do: "royalblue"
  defp color(:s), do: "limegreen"
  defp color(:z), do: "yellow"
  defp color(:o), do: "magenta"
  defp color(:i), do: "silver"
  defp color(:t), do: "saddlebrown"
  defp color(_), do: "red"

  defp new_game(socket) do
    assign(socket, game: Game.new())
  end

  defp new_tetromino(socket) do
    assign(socket, game: Game.new_tetromino(socket.assigns.game))
  end

  def rotate(%{assigns: %{game: game}} = socket) do
    assign(socket,
      game: Game.rotate(game)
    )
  end

  def left(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Game.left(game))
  end

  def right(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Game.right(game))
  end

  def down(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Game.down(game))
  end

  def handle_info(:tick, socket) do
    {:noreply, socket |> down}
  end

  def handle_event("keystroke", %{"key" => key}, socket) when key in @rotate_keys do
    {:noreply, socket |> rotate}
  end

  def handle_event("keystroke", %{"key" => "ArrowDown"}, socket) do
    {:noreply, socket |> down}
  end

  def handle_event("keystroke", %{"key" => "ArrowRight"}, socket) do
    {:noreply, socket |> right}
  end

  def handle_event("keystroke", %{"key" => "ArrowLeft"}, socket) do
    {:noreply, socket |> left}
  end

  def handle_event("keystroke", %{"key" => _}, socket) do
    {:noreply, socket}
  end
end
