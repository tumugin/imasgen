require 'rspec'

RSpec.shared_context :imasgen_shared do
  RSpec.shared_examples :imasgen_shared_ex do |matsuri, args|
    it 'can get one member' do
      # test instance
      tinst = args ? matsuri.new(*args) : matsuri.new
      expect(tinst).not_to be nil
      # get one character
      rand = tinst.name
      expect(rand.first.kanji).not_to be_empty
      expect(rand.first.hiragana).not_to be_empty
      expect(rand.first.katakana).not_to be_empty
      expect(rand.first.romaji).not_to be_empty
      expect(rand.last.kanji).not_to be_empty
      expect(rand.last.hiragana).not_to be_empty
      expect(rand.last.katakana).not_to be_empty
      expect(rand.last.romaji).not_to be_empty
      expect(rand.kanji).not_to be_empty
      expect(rand.hiragana).not_to be_empty
      expect(rand.katakana).not_to be_empty
      expect(rand.romaji).not_to be_empty
      # debug text
      @logger.debug(rand.kanji)
      @logger.debug(rand.hiragana)
      @logger.debug(rand.katakana)
      @logger.debug(rand.romaji)
    end

    it 'Hotchpotch festival!!' do
      # test instance
      tinst = args ? matsuri.new(*args) : matsuri.new
      # hotchpotch!!
      rand = tinst.hotchpotch
      expect(rand.first.kanji).not_to be_empty
      expect(rand.first.hiragana).not_to be_empty
      expect(rand.first.katakana).not_to be_empty
      expect(rand.first.romaji).not_to be_empty
      expect(rand.last.kanji).not_to be_empty
      expect(rand.last.hiragana).not_to be_empty
      expect(rand.last.katakana).not_to be_empty
      expect(rand.last.romaji).not_to be_empty
      expect(rand.kanji).not_to be_empty
      expect(rand.hiragana).not_to be_empty
      expect(rand.katakana).not_to be_empty
      expect(rand.romaji).not_to be_empty
      # debug text
      @logger.debug(rand.kanji)
      @logger.debug(rand.hiragana)
      @logger.debug(rand.katakana)
      @logger.debug(rand.romaji)
    end

    it 'use up all name pairs.' do
      tinst = args ? matsuri.new(*args) : matsuri.new
      expect do
        loop {tinst.name}
      end.to raise_error(StandardError, /Already used all name pairs/)
    end

    it 'use up all name pairs.(hotchpotch)' do
      tinst = args ? matsuri.new(*args) : matsuri.new
      # takes too long time so use this cheat
      tinst.hotchpotch
      tinst.instance_variable_get('@comb').each {|i| i[:used] = true}
      expect {
        loop {tinst.hotchpotch}
      }.to raise_error(StandardError, /Already used all name pairs/)
    end
  end
end

RSpec.describe do
  include_context :imasgen_shared
end
