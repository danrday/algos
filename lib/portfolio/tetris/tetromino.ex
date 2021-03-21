defmodule Portfolio.Tetris.Tetromino do
  defstruct shape: :l, rotation: 0, location: {2, -3}
  alias Portfolio.Tetris.Point
  alias Portfolio.Tetris.Points

  def new(options \\ []) do
    __struct__(options)
  end

  def new_random do
    new(shape: random_shape())
  end

  def left(tetro) do
    %{tetro | location: Point.left(tetro.location)}
  end

  def right(tetro) do
    %{tetro | location: Point.right(tetro.location)}
  end

  def down(tetro) do
    %{tetro | location: Point.down(tetro.location)}
  end

  def rotate(tetro) do
    %{tetro | rotation: rotate_degrees(tetro.rotation)}
  end

  def show(tetro) do
    tetro
    |> points
    |> Points.rotate(tetro.rotation)
    |> Points.move(tetro.location)
    |> Points.add_shape(tetro.shape)
  end

  def points(%{shape: :l}) do
    # l shape
    [
      {2, 1},
      {2, 2},
      {2, 3},
      {3, 3}
    ]
  end

  def points(%{shape: :j}) do
    # l shape
    [
      {3, 1},
      {3, 2},
      {2, 3},
      {3, 3}
    ]
  end

  def points(%{shape: :o}) do
    # l shape
    [
      {2, 2},
      {3, 2},
      {2, 3},
      {3, 3}
    ]
  end

  def points(%{shape: :i}) do
    # l shape
    [
      {2, 1},
      {2, 2},
      {3, 3},
      {2, 4}
    ]
  end

  def points(%{shape: :s}) do
    # l shape
    [
      {2, 2},
      {3, 2},
      {1, 3},
      {2, 3}
    ]
  end

  def points(%{shape: :z}) do
    # l shape
    [
      {1, 2},
      {2, 2},
      {2, 3},
      {3, 3}
    ]
  end

  def points(%{shape: :t}) do
    # l shape
    [
      {2, 1},
      {2, 2},
      {3, 2},
      {2, 3}
    ]
  end

  defp random_shape do
    ~w[i t o l j z s]a
    |> Enum.random()
  end

  defp rotate_degrees(270) do
    0
  end

  defp rotate_degrees(n) do
    n + 90
  end

  def maybe_move(_old, new, true = valid), do: new
  def maybe_move(old, _new, false = valid), do: old
end
