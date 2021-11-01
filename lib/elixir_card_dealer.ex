defmodule ElixirCardDealer do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Greets user.
  """
  def hello do
    "Hello there, Player."
  end

  @doc """
  Creates and returns a new deck of 52 cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]

    # List comprehension (works as a map)
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Returns a shuffled deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Ascertains whether deck of contains a given card.

  ## Examples

      iex> deck = ElixirCardDealer.create_deck
      iex> ElixirCardDealer.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
  Divides a deck of cards into a hand and the remaing deck.
  The `hand_size` argument specifies how many cards the hand should contain.

  ## Examples

      iex> deck = ElixirCardDealer.create_deck
      iex> {hand, _remaining} = ElixirCardDealer.deal(deck, 1)
      iex> hand
      ["Ace of Clubs"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a deck of cards to the filesystem.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a deck of cards from the filesystem.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "The file '#{filename}' does not exist."
    end
  end

  @doc """
  Creates, shuffles and divide a deck of cards into a hand.
  The `hand_size` argument specifies how many cards the hand should contain.
  """
  def create_hand(hand_size) do
    ElixirCardDealer.create_deck
    |> ElixirCardDealer.shuffle
    |> ElixirCardDealer.deal(hand_size)
  end
end
