module Imasgen
  class Name
    attr_reader :first, :last

    def initialize(namedata)
      @namedata = namedata
      @first = First.new(namedata)
      @last = Last.new(namedata)
    end

    def kanji
      "#{@last.kanji} #{@first.kanji}"
    end

    def hiragana
      "#{@last.hiragana} #{@first.hiragana}"
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
    end
  end
end
