require 'imasgen/name'

module Imasgen
  class GeneratorBase
    attr_accessor :auto_reset
    attr_reader :be_strict

    def initialize
      @namedic = []
      @used_pair = []
      @auto_reset = false
      @be_strict = true
    end

    def reset
      # reset dictonary cache
      @basedic = nil
      @first_names = nil
      @last_names = nil
      @comb = nil
    end

    def be_strict=(val)
      @be_stricte = val
      reset
    end

    def name
      # return random item.(no shuffle in first name and last name)
      item = lambda {
        @basedic ||= @be_strict ? @namedic.select {|i| i[:last_name] != '' && i[:first_name] != ''} : @namedic
        retval = @basedic.reject {|i| i[:used]}.sample
        throw StandardError.new('Already used all name pairs.') if retval.nil? && !@auto_reset
        if retval.nil? && @auto_reset
          # delete used flag
          @basedic.each {|i| i.delete(:used)}
          retval = @namedic.sample
        end
        retval
      }.call
      item[:used] = true
      Imasgen::Name.new(item)
    end

    def hotchpotch
      # hotchpotch mode
      item = lambda {
        @basedic ||= @be_strict ? @namedic.select {|i| i[:last_name] != '' && i[:first_name] != ''} : @namedic
        # make shuffle dictionary
        @first_names ||= @basedic.map {|i| {first_name: i[:first_name], first_name_furigana: i[:first_name_furigana]}}
        @last_names ||= @basedic.map {|i| {last_name: i[:last_name], last_name_furigana: i[:last_name_furigana]}}
        # shuffle!!
        @comb ||= @first_names.product(@last_names).map {|i| i[0].merge(i[1])}
        # get non duplicate item
        ret = @comb.reject {|i| i[:used]}.sample
        return ret unless ret.nil?
        if @auto_reset
          @comb.each {|i| i.delete(:used)}
          ret
        else
          throw StandardError.new('Already used all name pairs.')
        end
      }.call
      item[:used] = true
      Imasgen::Name.new(item)
    end
  end
end
