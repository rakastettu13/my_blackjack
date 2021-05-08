# frozen_string_literal: true

class Player
  attr_reader :bank, :points, :cards

  def initialize
    @bank = 100
    @points = 0
    @cards = {}
  end

  def hit(card)
    cards.merge!(card)
    scoring
  end

  def bet(value = 10)
    self.bank -= value
    value
  end

  def scoring
    self.points = 0
    cards.each_value do |value|
      value ||= if (points + 11) <= 21
                  11
                else
                  1
                end
      self.points += value
    end
  end

  protected

  attr_writer :bank, :points
end
