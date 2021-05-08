# frozen_string_literal: true

class Dealer < Player
  def go(deck)
    hit(deck.give1) if points < 17
  end
end
