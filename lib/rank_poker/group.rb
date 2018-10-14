# frozen_string_literal: true
require "ostruct"

module RankPoker
  class Group
    
    attr_accessor :value, :pair_size
    
    def initialize(args)
      @value = []
      @pair_size = []

      args.each do |arg|
        unless arg[1] == 1
          @value << arg[0]
          @pair_size << arg[1]
        end
      end

    end
  end
end
