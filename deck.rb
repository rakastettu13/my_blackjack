# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = Card.deck.clone
  end

  def give
    cards.sort_by! { rand }
    cards.delete(cards.sample)
  end
end
