# frozen_string_literal: true

module RankPoker
  class Hand
    include Comparable
    attr_reader :cards

    CARDS_PER_HAND = 5

    def initialize(cards)
      cards = cards.split(' ')
      raise ArgumentError, 'should have 5 cards' if cards.length != CARDS_PER_HAND

      @cards = cards.map { |card| Card.new(card) }
    end

    def pair?
      group_by_card_values.count == 4
    end

    def double_pair?
      count_group_of_pair == [1, 2, 2]
     end

    def three_of_a_kind?
      count_group_of_pair == [1, 1, 3]
    end

    def four?
      count_group_of_pair == [1, 4]
    end

    def full_house?
      count_group_of_pair == [2, 3]
    end

    def straight?
      if group_by_card_values.count == 5

        cards_in_order = @cards.map(&:value).sort

        cards_in_order.each_cons(2).all? do |first, second|
          first + 1 == second
        end
      end
    end

    def flush?
      @cards.map(&:suit).uniq.length == 1 if group_by_card_values.count == 5
    end

    def straight_flush?
      straight? && flush? && @cards.map(&:value).min < 8
    end

    def royal_flush?
      straight? && flush? && @cards.map(&:value).min == 8
    end

    def category
      # return the best category that matches this hand.
    end

    private

    # Group the array index into key => values
    #
    # @cards = ['TC 4S TC 4S 6S']
    # @returns HASH {[8]=>[8,8], [2]=> [2,2], [4]=>[4] }
    def group_by_card_values
      @cards.group_by(&:value)
    end

    # Convert group of card count
    #
    # @group_by_card_vales {[8]=>[8,8], [2]=> [2,2], [4]=>[4] }
    # @returns  [2,2,1] only return the total pair
    def count_group_of_pair
      rank_type = []

      group_by_card_values.each do |k, v|
        if v.count == 2
          rank_type << ['pair', k]
        elsif v.count == 3
          rank_type << ['three_of_a_kind', k]
        elsif v.count == 4
          rank_type << ['four', k]
        else
           # check straight || flush || highest_card
        end
      end

      return full_house = true if pair && three_of_a_kind
    end

    # Convert group of card
    #
    # @group_by_card_vales {[8]=>[8,8], [2]=> [2,2], [4]=>[4] }
    # @returns  [2,2,1] only the value
    def values_of_group_card
      group_by_card_values.map { |k, _v| k }.sort
    end
  end
end

# improve method naming or method return values making more sense
# DONE

# Need to remove unnessessary if statements
# DONE
# Need to change Card to use value written on the card.
# Ace's don't work at the bottom of a straight (A 2 3 4 5)
# Don't yet know the 'value' of the category like Pair of 5's
