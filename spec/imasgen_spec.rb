require 'rspec'
require 'imasgen'

RSpec.describe 'Imasgen' do
  it 'has a version number' do
    expect(Imasgen::VERSION).not_to be nil
  end
end