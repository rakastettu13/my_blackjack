# frozen_string_literal: true

class Game
  attr_reader :bank, :deck, :dealer, :user

  def initialize(bank)
    @deck = Deck.new
    @dealer = Dealer.new
    @user = User.new
    @bank = bank
  end

  def start
    user.hit(deck.give2)
    dealer.hit(deck.give2)
    bank.start
  end

  def play(action)
    user.hit(deck.give1) if action == :hit
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
