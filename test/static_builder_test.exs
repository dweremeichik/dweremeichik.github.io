defmodule StaticBuilderTest do
  use ExUnit.Case
  doctest StaticBuilder

  test "greets the world" do
    assert StaticBuilder.hello() == :world
  end
end
