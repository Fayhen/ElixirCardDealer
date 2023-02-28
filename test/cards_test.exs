defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffle randomizes a deck" do
    deck = Cards.create_deck

    # Warning: Randomization leading to same deck is not impossible
    refute deck == Cards.shuffle(deck)
  end

  test "deal splits deck of cards correctly" do
    deck = Cards.create_deck
    {hand, rest} = Cards.deal(deck, 5)

    assert length(hand) == 5
    assert length(rest) == length(deck) - 5
  end

  test "create_hand returns hand and remainder deck of correct size" do
    full_deck = Cards.create_deck
    {hand, rest} = Cards.create_hand(3)

    assert length(hand) == 3
    assert length(rest) == length(full_deck) - 3
  end
end
