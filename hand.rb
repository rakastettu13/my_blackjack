# frozen_string_literal: true

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def scoring
    cards.inject(0) do |sum, card|
      card.points ||= if (sum + 11) <= 21
                        11
                      else
                        1
                      end
      sum + card.points
    end
  end

  def full?
    cards.size == 3
  end
end
