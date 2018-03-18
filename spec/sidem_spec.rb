require 'rspec'
require 'imasgen'

RSpec.describe 'SideM' do
  include_examples :imasgen_shared_ex, Imasgen::SideMCls
end