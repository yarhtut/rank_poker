# frozen_string_literal: true

module RankPoker
  class Rank 
    include Comparable
    attr_reader :cards


    def initialize(cards)
      cards = cards.split(' ')
      raise ArgumentError, 'should have 5 cards' if cards.length != CARDS_PER_HAND

      @cards = cards.map { |card| Card.new(card) }
    end


  end
end
