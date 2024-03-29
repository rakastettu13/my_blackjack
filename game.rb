# frozen_string_literal: true

class Game
  attr_reader :bank, :deck, :dealer, :user

  def initialize(bank, dealer, user)
    @deck = Deck.new
    @dealer = dealer
    @user = user
    @bank = bank
    start
  end

  def start
    2.times do
      user.hit(deck.give)
      dealer.hit(deck.give)
    end
    bank.start
  end

  def play(action)
    user.hit(deck.give) if action == :hit
    dealer.go(deck) unless user.points > 21
  end

  def result
    hash = { user: user.points, dealer: dealer.points }
    points = hash.values
    if points.max == points.min
      tie
    elsif points.max > 21
      win hash.key(points.min)
    else
      win hash.key(points.max)
    end
  end

  private

  def win(player)
    bank.win player
    player
  end

  def tie
    bank.tie
    :tie
  end
end
