# frozen_string_literal: true

class Deck
  include Random::HashExtensions

  CARDS = %w[J Q K A].freeze

  attr_reader :cards

  def initialize
    @cards = {}
    create
  end

  def give
    cards.rand_pair!
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
