require 'yaml'
require 'imasgen/generator_base'

module Imasgen
  class SideMCls < Imasgen::GeneratorBase
    def initialize
      super
      yaml = YAML.load_file(__dir__ + '/dic/sidem.yml')
      @namedic = yaml[:sidem]
    end

    def self.getyaml
      YAML.load_file(__dir__ + '/dic/sidem.yml')[:sidem]
    end
  end

  def self.sidem
    @sidem ||= SideMCls.new
    @sidem
  end
end
