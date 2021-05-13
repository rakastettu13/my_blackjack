# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    create
  end

  def give
    cards.sort_by! { rand }
    cards.delete(cards.sample)
  end

  private

  def create
    Card::VALUES.each { |value| add_suits(value) }
  end

  def add_suits(value)
    Card::SUITS.each do |suit|
      points = if Card::VALUES[0...9].include?(value)
                 value.to_i
               elsif value != 'A'
                 10
               end
      cards.push(Card.new(value + suit, points))
    end
  end
end
