defmodule PortfolioWeb.HangmanLive do
  use PortfolioWeb, :live_view
  # alias PortfolioWeb.Tetris.{Tetromino, Game}

  @responses %{
    :won => {:info, "You Won!"},
    :lost => {:error, "You Lost :("},
    :good_guess => {:info, "Good guess!"},
    :bad_guess => {:error, "Bad guess!"},
    :already_used => {:info, "You already guessed that"}
  }

  @impl true
  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    {:ok, assign(socket, menu_open: false, game: game, tally: Hangman.tally(game))}
  end

  def handle_event("play", %{"letter" => guess}, %{assigns: %{game: game}} = socket) do
    tally = Hangman.make_move(game, guess)
    {status, message} = @responses[tally.game_state]
    IO.inspect(status)
    IO.inspect(message)

    {:noreply,
     socket
     |> clear_flash
     |> put_flash(status, message)
     |> assign(tally: tally)}
  end

  def handle_event("new_game", _, socket) do
    {:noreply, push_redirect(socket, to: "/hangman")}
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
