# frozen_string_literal: true
require 'spec_helper.rb'

RSpec.describe RankPoker::Group do
  # pair
  player_1 = RankPoker::Hand.new('TC 4S TC 5S 6S').category

  # two pair
  player_2 = RankPoker::Hand.new('TC 4S 6S 4S TC').category

  xit 'should be able to compare two different player' do
    RankPoker::Goup.new(hand.cateogory) > RankPoker::Goup.new(hand2.cateogory)
    expect(player_1 > player_2).to eq false
    expect(player_2 > player_1).to eq true
  end
end


