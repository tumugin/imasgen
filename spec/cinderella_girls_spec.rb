require 'rspec'
require 'imasgen'

RSpec.describe 'CinderellaGirls' do
  include_examples :imasgen_shared_ex, Imasgen::CinderellaGirlsCls
end
