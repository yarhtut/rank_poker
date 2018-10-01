# frozen_string_literal: true

require 'spec_helper.rb'

RSpec.describe RankPoker::Card do
  card_1 = RankPoker::Card.new('5D')
  card_2 = RankPoker::Card.new('6D')
  card_3 = RankPoker::Card.new('6S')

  it 'should be able to compare two different card' do
    expect(card_1 > card_2).to eq false
    expect(card_2 > card_1).to eq true
  end

  it 'should be able to compare suit if the card are the same' do
    expect(card_3 > card_2).to eq true
  end

  it 'should be able to compare the smae card as equal' do
    expect(card_1 == card_1).to eq true
  end
end
