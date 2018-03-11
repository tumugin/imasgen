require 'imasgen/name'

module Imasgen
  class GeneratorBase
    attr_accessor :auto_reset, :be_strict

    def initialize
      @namedic = []
      @used_pair = []
      @auto_reset = false
      @be_strict = true
    end

    def name
      # return random item.(no shuffle in first name and last name)
      item = lambda {
        basedic = @be_strict ? @namedic.select {|i| i[:last_name] != '' && i[:first_name] != ''} : @namedic
        retval = (basedic - @used_pair).sample
        throw StandardError.new('Already used all name pairs.') if retval.nil? && !@auto_reset
        if retval.nil? && @auto_reset
          @used_pair.clear
          retval = @namedic.sample
        end
        retval
      }.call
      @used_pair << item
      Imasgen::Name.new(item)
    end

    def hotchpotch
      # hotchpotch mode
      item = lambda {
        basedic = @be_strict ? @namedic.select {|i| i[:last_name] != '' && i[:first_name] != ''} : @namedic
        # make shuffle dictionary
        first_names = basedic.map {|i| {first_name: i[:first_name], first_name_furigana: i[:first_name_furigana]}}
        last_names = basedic.map {|i| {last_name: i[:last_name], last_name_furigana: i[:last_name_furigana]}}
        # shuffle!!
        comb = first_names.product(last_names).map {|i| i[0].merge(i[1])}
        # get non duplicate item
        ret = (comb - @used_pair).sample
        return ret unless ret.nil?
        if @auto_reset
          @used_pair.clear
          ret
        else
          throw StandardError.new('Already used all name pairs.')
        end
      }.call
      @used_pair << item
      Imasgen::Name.new(item)
    end
  end
end
