# frozen_string_literal: true

class Player
  attr_reader :points, :hand

  def initialize
    @points = 0
    @hand = Hand.new
  end

  def hit(card)
    hand.cards.push(card)
    self.points = hand.scoring
  end

  protected

  attr_writer :points
end
