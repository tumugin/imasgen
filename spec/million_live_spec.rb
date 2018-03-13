require 'imasgen'
require 'json'

RSpec.describe 'MillionLive' do
  include_examples :imasgen_shared_ex, Imasgen::MillionLiveCls
end
