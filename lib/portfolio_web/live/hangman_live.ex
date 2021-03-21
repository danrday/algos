defmodule PortfolioWeb.HangmanLive do
  use PortfolioWeb, :live_view
  # alias PortfolioWeb.Tetris.{Tetromino, Game}

  @impl true
  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    {:ok, assign(socket, menu_open: false, game: game, tally: Hangman.tally(game))}
  end

  def handle_event("play", %{"letter" => guess}, %{assigns: %{game: game}} = socket) do
    tally = Hangman.make_move(game, guess)
    {:noreply, assign(socket, tally: tally)}
  end
end
