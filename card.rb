# frozen_string_literal: true

class Card
  SUITS = ['♠', '♥', '♦', '♣'].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  attr_accessor :indicator, :points

  def initialize(indicator, points)
    @indicator = indicator
    @points = points
  end
end
