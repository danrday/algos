 defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  test "greets the world" do
    assert  :ok == Hangman.hello()
  end
end
