defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 40 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 40
  end
end
