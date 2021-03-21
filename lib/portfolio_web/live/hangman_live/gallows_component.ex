defmodule GallowsComponent do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use Phoenix.LiveComponent

  def turn(left, target) when target >= left do
    "opacity: 1"
  end

  def turn(_left, _target) do
    "opacity: 0.1"
  end
end
