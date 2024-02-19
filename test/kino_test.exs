defmodule Bio.KinoTest do
  use ExUnit.Case
  doctest Bio.Kino

  test "greets the world" do
    assert Bio.Kino.hello() == :world
  end
end
