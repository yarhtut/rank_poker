# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe RankPoker::Hand do
  it 'should be return argument error' do
    expect { RankPoker::Hand.new('TC 4S 4S 6S') }.to raise_error('should have 5 cards')
  end

  it 'should have a pair' do
    expect(RankPoker::Hand.new('TC 4S TC 5S 6S').pair?).to be true
  end

  it 'should have a double pair' do
    expect(RankPoker::Hand.new('TC 4S TC 4S 6S').two_pair?).to be true
  end

  it 'should have a two pair' do
    expect(RankPoker::Hand.new('TC 4S 6S 4S TC').two_pair?).to be true
  end

  context '#four_of_a_kind?' do
    it 'should have a four' do
      expect(RankPoker::Hand.new('TC TS TD TC 6S').four_of_a_kind?).to be true
    end

    it 'should have a right category name' do
      expect(RankPoker::Hand.new('TC TS TD TC 6S').category).to be 'Four of a kind'
    end
  end

  context '#three_of_a_kind?' do
    it 'should have a three_king' do
      expect(RankPoker::Hand.new('TC 4S TD TS 6S').three_of_a_kind?).to be true
    end

    it 'should have a right category name' do
      expect(RankPoker::Hand.new('TC 4S TD TS 6S').category).to eq 'Three of a kind'
    end
  end

  context '#full_house?' do
    it 'should have a full house' do
      expect(RankPoker::Hand.new('TC 6S TD TS 6D').full_house?).to be true
    end
    it 'should have a right category name' do
      expect(RankPoker::Hand.new('TC 6S TD TS 6D').category).to eq 'Full house'
    end
  end

  context '#straight?' do
    it 'should return true for straight' do
      expect(RankPoker::Hand.new('TC JS QD KS AD').straight?).to be true
    end

    it 'should return true for straight' do
      expect(RankPoker::Hand.new('2C 3S 4D 5S AD').straight?).to be true
    end

    it 'should return false for straight' do
      expect(RankPoker::Hand.new('TC JS QD KS 2D').straight?).to be false
    end
  end

  context '#flush?' do
    it 'should return true for flush' do
      expect(RankPoker::Hand.new('2C JC QC KC 5C').flush?).to be true
    end

    it 'should return false for flush' do
      expect(RankPoker::Hand.new('2C 3C 4D KC 5C').flush?).to be false
    end
  end

  context '#straight_flush?' do
    it 'should return true for straight flush' do
      expect(RankPoker::Hand.new('2C 3C 4C 5C 6C').straight_flush?).to be true
    end

    it 'should return false for straight flush' do
      expect(RankPoker::Hand.new('2C 3C 4D KC 5C').straight_flush?).to be false
      expect(RankPoker::Hand.new('TC JC QD KC AC').straight_flush?).to be false
    end
  end

  context '#royal_flush?' do
    it 'should return true for royal flush' do
      expect(RankPoker::Hand.new('TH JH QH KH AH').royal_flush?).to be true
    end

    it 'should return false for royal flush' do
      expect(RankPoker::Hand.new('2C 3C 4C 5C 6C').royal_flush?).to be false
      expect(RankPoker::Hand.new('TC JC QD KC AC').royal_flush?).to be false
    end
  end

  context '#compair_hand' do
    # pair
    player_1 = RankPoker::Hand.new('TC 4S TC 5S 6S')

    # two_pair
    player_2 = RankPoker::Hand.new('TC 4S 6S 4S TC')
    player_3 = RankPoker::Hand.new('JC 4S 6S 4S JC')
    player_4 = RankPoker::Hand.new('TC 5S 6S 5S TC')

    # three_of_a_kind 
    player_5 = RankPoker::Hand.new('TC TS 6S 4S TC')

    it 'with `pair` vs `two pair` ' do
      expect(player_2 <=> player_1).to eq 1 
      expect(player_1 <=> player_2).to eq -1 
    end

    it 'with `two pair` vs `two pair` between larger pair' do
      expect(player_3 <=> player_2).to eq 1 
      expect(player_2 <=> player_3).to eq -1 
    end

    it 'with `two pair` vs `two pair` between larger pair ignore lower pair' do
      expect(player_3 <=> player_4).to eq 1 
      expect(player_4 < player_3).to eq true
      expect(player_4 > player_2).to eq true 
    end

    it 'with `two pair` vs `three of a kind` between larger suit for' do
      expect(player_5 <=> player_4).to eq 1 
      expect(player_4 <=> player_5).to eq -1 
    end
  end
end
