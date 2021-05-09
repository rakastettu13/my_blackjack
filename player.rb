# frozen_string_literal: true

class Player
  attr_reader :points, :cards

  def initialize
    @points = 0
    @cards = {}
  end

  def hit(card)
    cards.merge!(card)
    scoring
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

  def show
    cards.each_key { |key| print "#{key}\t" }
    puts "\n"
  end

  protected

  attr_writer :points
end
