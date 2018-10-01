# frozen_string_literal: true

module RankPoker
  class Card
    include Comparable

    VALUES = %w[2 3 4 5 6 7 8 9 T J Q K A].freeze
    SUITS = %(C D H S)

    attr_accessor :value, :suit

    # each card has value + suit
    # args [0] is a number
    # args [1] is type
    def initialize(args)
      @value = VALUES.index(args[0])
      @suit = SUITS.index(args[1])
    end

    def <=>(other_card)
        value <=> other_card.value
      # if (value <=> other_card.value) == 0
      #   suit <=> other_card.suit
      # else
      # end
    end

    def pair 
      binding.pry
    end
  end
end
