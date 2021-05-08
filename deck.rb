# frozen_string_literal: true

class Deck
  include Random::HashExtensions

  CARDS = %w[J Q K A].freeze

  attr_reader :cards

  def initialize
    @cards = {}
    create
  end

  def give1
    card = cards.rand_pair!
    { card[0] => card[1] }
  end

  def give2
    give1.merge(give1)
  end

  private

  def create
    (2...11).each do |i|
      add(i.to_s, i)
    end
    CARDS.each do |key|
      value = 10 unless key == 'A'
      add(key, value)
    end
  end

  def add(key, value)
    cards["#{key}♠"] = value
    cards["#{key}♥"] = value
    cards["#{key}♦"] = value
    cards["#{key}♣"] = value
  end
end
