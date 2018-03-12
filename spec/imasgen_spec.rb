require 'imasgen'
require 'json'

RSpec.describe Imasgen do
  it 'has a version number' do
    expect(Imasgen::VERSION).not_to be nil
  end

  it 'can get one Million Live! member' do
    # test instance
    imas_ml = Imasgen::MillionLiveCls.new
    expect(imas_ml).not_to be nil
    # get one character
    rand = imas_ml.name
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
    imas_ml = Imasgen::MillionLiveCls.new
    # hotchpotch!!
    rand = imas_ml.hotchpotch
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

  it 'test exception' do
    imas_ml = Imasgen::MillionLiveCls.new
    expect {
      loop { imas_ml.name }
    }.to raise_error(UncaughtThrowError, /Already used all name pairs/)
  end

  it 'test exception 2' do
    imas_ml = Imasgen::MillionLiveCls.new
    expect {
      loop { imas_ml.hotchpotch }
    }.to raise_error(UncaughtThrowError, /Already used all name pairs/)
  end
end
