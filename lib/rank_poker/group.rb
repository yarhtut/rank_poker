# frozen_string_literal: true
require "ostruct"

module RankPoker
  class Group
    
    attr_accessor :value, :size
    
    def initialize(value, size)
      @value = value 
      @size = size 
    end

    def pair?
      size == 2
    end

    def tripple?
      size == 3
    end

    def fours?
      size == 4
    end
  end
end
