# frozen_string_literal: true

class Card
  SUITS = ['♠', '♥', '♦', '♣'].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  attr_accessor :indicator, :points

  class << self
    attr_accessor :deck

    def create_deck
      @deck = []
      VALUES.each { |value| add_suits(value) }
    end

    def add_suits(value)
      SUITS.each do |suit|
        points = if VALUES[0...9].include?(value)
                   value.to_i
                 elsif value != 'A'
                   10
                 end
        deck.push(new(value + suit, points))
      end
    end
  end

  def initialize(indicator, points)
    @indicator = indicator
    @points = points
  end
end
