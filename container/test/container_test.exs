defmodule ContainerTest do
  use ExUnit.Case
  doctest Container

  test "greets the world" do
    assert Container.hello() == :world
  end
end
