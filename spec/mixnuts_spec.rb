require 'imasgen'
require 'rspec'

RSpec.describe 'MIXNUTS' do
  include_examples :imasgen_shared_ex,
                   Imasgen::MIXNUTSCls,
                   [Imasgen::CINDERELLA, Imasgen::MILLIONLIVE, Imasgen::SIDEM]

  it 'Raise the FLAG' do
    expect do
      Imasgen.mixnuts(:aqours,:lovelive_sunshine)
    end.to raise_error(ArgumentError)
  end
end