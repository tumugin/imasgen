require 'moji'
require 'romaji'

module Imasgen
  class Name
    attr_reader :first, :last

    def initialize(namedata)
      @namedata = namedata
      @first = First.new(namedata)
      @last = Last.new(namedata)
    end

    def to_s
      kanji
    end

    def to_str
      kanji
    end

    def kanji
      "#{@last.kanji} #{@first.kanji}"
    end

    def hiragana
      "#{@last.hiragana} #{@first.hiragana}"
    end

    def katakana
      "#{@last.katakana} #{@first.katakana}"
    end

    def romaji
      "#{@first.romaji} #{@last.romaji}"
    end

    class First
      def initialize(namedata)
        @namedata = namedata
      end

      def hiragana
        @namedata[:first_name_furigana]
      end

      def kanji
        @namedata[:first_name]
      end

      def katakana
        Moji.hira_to_kata(@namedata[:first_name_furigana])
      end

      def romaji
        Romaji.kana2romaji(@namedata[:first_name_furigana]).capitalize
      end
    end

    class Last
      def initialize(namedata)
        @namedata = namedata
      end

      def hiragana
        @namedata[:last_name_furigana]
      end

      def kanji
        @namedata[:last_name]
      end

      def katakana
        Moji.hira_to_kata(@namedata[:last_name_furigana])
      end

      def romaji
        Romaji.kana2romaji(@namedata[:last_name_furigana]).capitalize
      end
    end
  end
end
