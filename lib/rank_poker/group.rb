# frozen_string_literal: true
require "ostruct"

module RankPoker
  class Group
    
    attr_accessor :value, :pair_size
    
    def initialize(value, pair_size)
      # args.each do |value, pair_size|
      #   @value = value
      #   @pair_size = pair_size.count
      # end
      @value = value
      @pair_size = pair_size
    end
  end
end
