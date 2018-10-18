module RankPoker
  class Hand
    include Comparable
    attr_reader :cards

    CARDS_PER_HAND = 5

    CATEGORIES = [
      'Pair',
      'Two pair',
      'Three of a kind',
      'Flush',
      'Full house',
      'Straight',
      'Four of a kind',
      'Straight flush',
      'Royal flush'
    ].freeze

    def initialize(cards)
      cards = cards.split(' ')
      raise ArgumentError, 'should have 5 cards' if cards.length != CARDS_PER_HAND

      @cards = cards.map { |card| Card.new(card) }
    end

    def <=>(other_hand)
      if (CATEGORIES.index(category) == CATEGORIES.index(other_hand.category))
        group_of_cards.value.reverse <=> other_hand.group_of_cards.value.reverse
      else
        CATEGORIES.index(category) <=> CATEGORIES.index(other_hand.category)
      end
      
    end

    # look into instead all calling every single methods.
    def category
      {
        'Royal flush' => royal_flush?,
        'Straight flush' => straight_flush?,
        'Four of a kind' => four_of_a_kind?,
        'Full house' => full_house?,
        'Straight' => straight?,
        'Flush' => flush?,
        'Three of a kind' => three_of_a_kind?,
        'Two pair' => two_pair?,
        'Pair' => pair?
      }
        .find { |_name, method| method == true }.first
    end

    def pair?
      uniq_cards.count == 4
    end

    def two_pair?
      group_of_cards.any?(&:pair?)
    end
    

    def three_of_a_kind?
      group_of_cards.any?(&:tripple?)
    end
    
    def four_of_a_kind?
      group_of_cards.any?(&:fours?)
    end
    

    def full_house?
      group_of_cards.any?(&:tripple?) && group_of_cards.any?(&:pair?)
    end
    
    def straight?
      if uniq_cards.count == 5

        cards_in_order = @cards.map(&:value).sort

        if cards_in_order.first == 2 && cards_in_order.last == 14
          cards_in_order.delete(14)
          cards_in_order << 1
        end

        cards_in_order.sort.each_cons(2).all? do |first, second|
          first + 1 == second
        end
      end
    end

    def flush?
      @cards.map(&:suit).uniq.length == 1 if uniq_cards.count == 5
    end

    def straight_flush?
      straight? && flush? && @cards.map(&:value).min < 10
    end

    def royal_flush?
      straight? && flush? && @cards.map(&:value).min == 10
    end


    # Group the array index into key => values
    #
    # @cards = ['TC 4S TC 4S 6S']
    # @returns HASH {[8]=>[8,8], [2]=> [2,2], [4]=>[4] }
    def uniq_cards
      @cards.group_by(&:value)
    end

    # create group object
    #
    # @ uniq_cards {[8]=>[8,8], [2]=> [2,2], [4]=>[4] }
    # @ return  card value[] and pair_size[]
    def group_of_cards
      uniq_cards.map do |card_value, cards| 
        Group.new(card_value, cards.count) 
      end
    end
  end
end
