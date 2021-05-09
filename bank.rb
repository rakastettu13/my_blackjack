# frozen_string_literal: true

class Bank
  attr_reader :user, :dealer, :game

  def initialize
    @user = 100
    @dealer = 100
    @game = 0
  end

  def start(bet = 10)
    @user -= bet
    @dealer -= bet
    @game += bet * 2
  end

  def win(player)
    send "#{player}=".to_sym, send(player) + game
    self.game = 0
  end

  def tie
    self.user += game / 2
    self.dealer += game / 2
    self.game = 0
  end

  private

  attr_writer :user, :dealer, :game
end
