require 'imasgen'
require 'json'

RSpec.describe Imasgen do
  it 'has a version number' do
    expect(Imasgen::VERSION).not_to be nil
  end

  it 'can get one Million Live! member' do
    imas_ml = Imasgen::MillionLiveCls.new
    expect(imas_ml).not_to be nil
    rand = imas_ml.name
    expect(rand.first.kanji).not_to be nil
    expect(rand.last.kanji).not_to be nil
    @logger.debug(rand)
    expect(Imasgen.millionlive.name.kanji).not_to be nil
    @logger.debug(Imasgen.millionlive.name.kanji)
    @logger.debug(Imasgen.millionlive.name.hiragana)
  end

  it 'Hotchpotch festival!!' do
    expect(Imasgen.millionlive.hotchpotch.kanji).not_to be nil
    @logger.debug(Imasgen.millionlive.hotchpotch.kanji)
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
