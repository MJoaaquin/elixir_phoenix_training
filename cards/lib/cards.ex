defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings refresenting a deck of playing cards
  """
  def create_deck do
    values = ["Uno", "Dos", "Tres", "Cuatro", "Cinco", "Seis", "Siete", "Diez", "Once", "Doce"]
    suits = ["Oro", "Copa", "Espada", " Basto"]

    for suit <- suits, value <- values do
      "#{value} de #{suit}"
    end
  end

  @doc """
    Return our mixed deck
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Check if this card exist in the deck

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Uno de Espada")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Uno de Oro"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save our deck
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Load our deck
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Create a deck, shuffle and deal the selected number of cards
  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
